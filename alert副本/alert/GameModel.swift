//
//  GameModel.swift
//  alert
//
//  Created by mohoo on 14-8-6.
//  Copyright (c) 2014年 mohoo. All rights reserved.
//定义一个类，然后只要在别的累里面声明这种类，我们就可以调用这个类里面的各种函数。
//而且只要定义一个全局变量并进行页面传值就可以很好的进行页面操作！
import Foundation
import UIKit
class GameModel{
    var dimension:Int = 0
    //4*4
    var tiles:Array<Int>
    init(dimension:Int){
        self.dimension = dimension
        self.tiles = Array<Int>(count:self.dimension*self.dimension, repeatedValue: 0)
    }
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
    func emptyPositions()->[Int] {
        var emptytiles = Array<Int>()
        for i in 0..<dimension*dimension{
            if (tiles[i] == 0) {
                emptytiles += i
            }
        }
         return emptytiles
    }
    func isFull()->Bool{
        if emptyPositions().count==0{
            return true
        }
        return false
    }
}
