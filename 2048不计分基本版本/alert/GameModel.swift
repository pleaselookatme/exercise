//
//  GameModel.swift
//  alert
//
//  Created by mohoo on 14-8-6.
//  Copyright (c) 2014年 mohoo. All rights reserved.
//定义一个类，然后只要在别的累里面声明这种类，我们就可以调用这个类里面的各种函数。
//而且只要定义一个全局变量并进行页面传值就可以很好的进行页面操作！
import Foundation

class GameModel{
    var dimension:Int = 0
    //4*4
    var tiles: Array<Int>
    var mtiles:Array<Int>
    init(dimension:Int){
        self.dimension = dimension
        self.tiles = Array<Int>(count:self.dimension*self.dimension, repeatedValue: 0)
        self.mtiles = Array<Int>(count:self.dimension*self.dimension, repeatedValue: 0)
    }
    
    
    func initTiles(){
        self.tiles = Array<Int>(count:self.dimension*self.dimension, repeatedValue: 0)
        self.mtiles = Array<Int>(count:self.dimension*self.dimension, repeatedValue: 0)
    }
    
    
    
    
    
    
    
    //设置位置
    func setPosition(row:Int, col:Int, value:Int) -> Bool {
        assert(row >= 0 && row < dimension)
        assert(col >= 0 && col < dimension)
        //3h 4l row =2 col =3 index = 2*4+3=11
        var index = self.dimension * row + col
        var val = tiles[index]
        if val > 0{
            println("该位置已经有值了")
            return false
        }
        tiles[index] = value
        return true
    }
    //返回一个数组
    func emptyPositions()->[Int] {
        var emptytiles = Array<Int>()
        for i in 0..<dimension*dimension{
            if (tiles[i] == 0) {
                emptytiles += i
            }
        }
        return emptytiles
    }
    //检查是否非空
    func isFull()->Bool{
        if emptyPositions().count==0{
            return true
        }
        return false
    }
    func copyToMtiles(){
        for i in 0..<self.dimension*self.dimension{
            mtiles[i] = tiles[i]//这里发生过错误
        }
    }
    func copyFromMtiles(){
        for i in 0..<self.dimension*self.dimension{
            tiles[i] = mtiles[i]//这里也发生过错误
        }
        
    }
    //重排，只要上面有空隙就直接网上走 gmodel.copyFromMtiles()
    
    func reflowUp()
    {
        copyToMtiles()
        var index:Int
        for var i=dimension-1; i>0; i--
        {
            for j in 0..<dimension
            {
                index = self.dimension * i+j
                if(mtiles[index-self.dimension] == 0
                    && (mtiles[index] > 0))
                {
                    mtiles[index-self.dimension] = mtiles[index]
                    mtiles[index] = 0
                    
                    var subindex:Int = index
                    while(subindex+self.dimension<mtiles.count)
                    {
                        if(mtiles[subindex+self.dimension]>0)
                        {
                            mtiles[subindex] = mtiles[subindex+self.dimension]
                            mtiles[subindex+self.dimension] = 0
                        }
                        subindex += self.dimension
                    }
                }
            }
        }
        copyFromMtiles()
    }
    
    func reflowDown()
    {
        copyToMtiles()
        var index:Int
        for i in 0..<dimension-1 {
            for j in 0..<dimension {
                index = self.dimension * i + j
                if (mtiles[index+self.dimension] == 0)
                    && (mtiles[index] > 0)
                {
                    mtiles[index+self.dimension] = mtiles[index]
                    mtiles[index] = 0
                    var subindex:Int = index
                    //对后面的内容进行检查
                    while((subindex-self.dimension)>=0)
                    {
                        if (mtiles[subindex-self.dimension]>0)
                        {
                            mtiles[subindex] = mtiles[subindex-self.dimension]
                            mtiles[subindex-self.dimension] = 0
                        }
                        subindex -= self.dimension
                    }
                    
                }
            }
        }
        copyFromMtiles()
    }
    
    func reflowLeft()
    {
        copyToMtiles()
        var index:Int
        for i in 0..<dimension {
            for var j=dimension-1; j>0; j-- {
                index = self.dimension * i + j
                if (mtiles[index-1] == 0)
                    && (mtiles[index] > 0)
                {
                    mtiles[index-1] = mtiles[index]
                    mtiles[index] = 0
                    var subindex:Int = index
                    //对后面的内容进行检查
                    while((subindex+1) < i*dimension+dimension)
                    {
                        if (mtiles[subindex+1]>0)
                        {
                            mtiles[subindex] = mtiles[subindex+1]
                            mtiles[subindex+1] = 0
                        }
                        subindex += 1
                    }
                    
                }
            }
        }
        copyFromMtiles()
    }
    
    
    func reflowRight()
    {
        copyToMtiles()
        var index:Int
        for i in 0..<dimension {
            for j in 0..<dimension-1 {
                index = self.dimension * i + j
                if (mtiles[index+1] == 0)
                    && (mtiles[index] > 0)
                {
                    mtiles[index+1] = mtiles[index]
                    mtiles[index] = 0
                    var subindex:Int = index
                    //对后面的内容进行检查
                    while((subindex-1) > i*dimension-1)
                    {
                        if (mtiles[subindex-1]>0)
                        {
                            mtiles[subindex] = mtiles[subindex-1]
                            mtiles[subindex-1] = 0
                        }
                        subindex -= 1
                    }
                    
                }
            }
        }
        copyFromMtiles()
    }
    
    //数字合并的算法
    func mergeUp(){
        copyToMtiles()
        var index:Int
        for var i=dimension-1; i>0; i-- {
            for j in 0..<dimension {
               index = self.dimension*i+j
                if ((mtiles[index]>0) && (mtiles[index-self.dimension]==mtiles[index])){
                    mtiles[index-self.dimension] = mtiles[index]*2
                    mtiles[index] = 0
                }
                
            }
        }
        copyFromMtiles()
    }
    
    func mergeDown()
    {
        copyToMtiles()
        var index:Int
        for i in 0..<dimension-1 {
            for j in 0..<dimension {
                index = self.dimension * i + j
                if (mtiles[index] > 0 && mtiles[index+self.dimension] == mtiles[index])
                {
                    mtiles[index+self.dimension] = mtiles[index] * 2
                    mtiles[index] = 0
                }
            }
        }
        copyFromMtiles()
    }
    
    func mergeLeft()
    {
        copyToMtiles()
        var index:Int
        for i in 0..<dimension {
            for var j=dimension-1; j>0; j-- {
                index = self.dimension * i + j
                if (mtiles[index] > 0 && mtiles[index-1] == mtiles[index])
                {
                    mtiles[index-1] = mtiles[index] * 2
                    mtiles[index] = 0
                }
            }
        }
        copyFromMtiles()
    }
    
    func mergeRight()
    {
        copyToMtiles()
        var index:Int
        for i in 0..<dimension {
            for j in 0..<dimension-1 {
                index = self.dimension * i + j
                if (mtiles[index] > 0 && mtiles[index+1] == mtiles[index])
                {
                    mtiles[index+1] = mtiles[index] * 2
                    mtiles[index] = 0
                }
            }
        }
        copyFromMtiles()
    }
    
}













