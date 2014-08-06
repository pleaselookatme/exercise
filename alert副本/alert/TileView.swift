

//
//  TitleView.swift
//  alert
//
//  Created by mohoo on 14-8-6.
//  Copyright (c) 2014年 mohoo. All rights reserved.
//

import UIKit
class TileView:UIView {
    let colorMap = [2:UIColor.redColor(),
        4:UIColor.orangeColor(),
        8:UIColor.yellowColor(),
        16:UIColor.greenColor(),
        32:UIColor.brownColor(),
        64:UIColor.blueColor(),
        128:UIColor.purpleColor(),
        256:UIColor.cyanColor(),
        512:UIColor.lightGrayColor(),
        1024:UIColor.magentaColor(),
        2048:UIColor.blackColor()]
    
    
    var value:Int = 0 {
    didSet{   //触发器
        backgroundColor = colorMap[value]
        numberLable.text = "\(value)"
        
    }
    }
    var numberLable:UILabel
    init(pos:CGPoint,width:CGFloat,value:Int){
        numberLable = UILabel(frame: CGRectMake(0, 0, width, width))
        numberLable.textColor = UIColor.whiteColor()
        numberLable.textAlignment = NSTextAlignment.Center
        numberLable.minimumScaleFactor = 0.5
        numberLable.font = UIFont(name:"微软雅黑", size: 20)
        numberLable.text = "\(value)"
        super.init(frame:CGRectMake(pos.x, pos.y, width, width))
        addSubview(numberLable)
        self.value = value
        backgroundColor = colorMap[value]
    }
}