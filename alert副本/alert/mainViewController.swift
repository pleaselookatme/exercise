//
//  mainViewController.swift
//  alert
//
//  Created by mohoo on 14-8-6.
//  Copyright (c) 2014年 mohoo. All rights reserved.
//主视图在这个页面产生

import Foundation
import UIKit
class mainViewController:UIViewController{
    //游戏方格维度
    var dimension:Int = 4
    //过关最大值
    var maxnumber:Int = 2048
    //数字格子的宽度
    var width:CGFloat = 50
    //格子之间的间距
    var padding:CGFloat = 6
    //保存背景图数据
    var backgrounds: Array<UIView>//uiview数组格式
    
    //游戏数据模型
    var gmodel:GameModel
   //保存界面上数字lable数据
   // var tiles:
    
    init(){
        self.backgrounds =  Array<UIView>()
        //self.
        self.gmodel = GameModel(dimension: self.dimension)//非常的好的想法，把self.dimension 成功传值到gamemodel里面。可以调用页面的init，nice！！
        super.init(nibName: nil, bundle: nil)
    
    }
   
    
    override func viewDidLoad()
   { super.viewDidLoad()
    setupBackground()//设置背景
    for i in 0...15{
      genNumber()//产生数字
    }
    setButtons()
    }
   
    //设置新button
    func setButtons(){
        var cv = ControlView()
        var btnreset = cv.createButton("重置", action:Selector("resetTapped"), sender: self)
        btnreset.frame.origin.x = 50
        btnreset.frame.origin.y = 450
        self.view.addSubview(btnreset)
        var btngen = cv.createButton("新数", action:Selector("genTapped"), sender: self)
        btngen.frame.origin.x = 150
       btngen.frame.origin.y = 450
        self.view.addSubview(btngen)
    }
    //给出button对应的事件
    func resetTapped(){
        println("reset!!!")
        
        
    }
    func genTapped(){
        println("new number!")
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //设置背景，一列一列的产生方格，padding间距
    func setupBackground(){
        var x:CGFloat = 30
        var y:CGFloat = 150
        for i in 0..<dimension {
            y =  150
            for j in 0..<dimension {
                var background = UIView(frame: CGRectMake(x, y, width, width))
                background.backgroundColor = UIColor.darkGrayColor()
                self.view.addSubview(background)
                backgrounds += background//把背景图保存在backgrounds
                y += padding + width
            }
            x += padding + width
        }
    }
    func genNumber(){
        var seedNumber = [2,4]
        let randv = Int(arc4random_uniform(10))//10%的概率，10以内的随机数
        
        println(randv)
        var seed:Int = 2
        if  randv == 1 {
            seed = 4
        }
        let col = Int(arc4random_uniform(UInt32(dimension)))
        let row = Int(arc4random_uniform(UInt32(dimension)))
        
        if (gmodel.isFull()){
            println("位置已经满了")
            return
        }
        if (gmodel.setPosition(row ,col:col , value:seed)==false){
        genNumber()
       return
        }
        insertTitle((row,col), value: seed)
    }
    
    func insertTitle(pos:(Int,Int),value:Int){
        let (row,col) = pos;
        let x = 30 + CGFloat(col)*(width+padding)
        let y = 150 + CGFloat(row)*(width+padding)
        let tile = TileView(pos: CGPoint(x: x,y: y), width: width, value: value)
        self.view.addSubview(tile)
        self.view.bringSubviewToFront(tile)
        tile.layer.setAffineTransform(CGAffineTransformMakeScale(0.1, 0.1))//动画展示
        //动画显示以0.3，延迟0.1秒数字出现，以后可以调用着玩
        UIView.animateWithDuration(0.3, delay: 0.1, options: UIViewAnimationOptions(), animations: {
            () -> Void in
            tile.layer.setAffineTransform(CGAffineTransformMakeScale(1, 1))
            },
            completion: {
                (finished:Bool) -> Void in
                UIView.animateWithDuration(0.08,animations:{
                    ()-> Void in
                    tile.layer.setAffineTransform(CGAffineTransformIdentity)
                    })
            })
    }
}


















