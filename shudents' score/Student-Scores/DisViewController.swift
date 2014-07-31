//
//  DisViewController.swift
//  Student-Scores
//
//  Created by hy on 14-7-29.
//  Copyright (c) 2014年 hy. All rights reserved.
//

import Foundation

import UIKit



class DisViewController: UIViewController {
    
    var array = ["name", "subject", "term", "score", "grade"]
    var username = NSString()
    var userid = NSString()
    var dis = Array<NSString>()
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //self.view.backgroundColor = UIColor.blueColor()
       self.view.backgroundColor = UIColor(red: CGFloat(93)/255.0, green: CGFloat(138)/255.0, blue: CGFloat(230)/255.0, alpha: 1.0)
        //for index in 0...4 {
            
       // }
        
        var l = dis.count
        for i in 0..<(l/5){
            for j in 0...4{
                var DisplayLabel = UILabel()
                var gradeLabel = UILabel()
                gradeLabel.frame = CGRectMake(CGFloat(j)*60 + 15.0, 25.0, 60.0, 20.0)
                gradeLabel.text = array[j]
                gradeLabel.font = UIFont(name:nil, size:12.0)
                gradeLabel.textColor = UIColor.whiteColor()
                gradeLabel.textAlignment = NSTextAlignment.Left
                self.view.addSubview(gradeLabel)
                DisplayLabel.frame = CGRectMake((CGFloat(j)*60+15.0), 65.0+CGFloat(i)*25.0, 40.0, 20.0)
                DisplayLabel.text = dis[i*5+j]
                DisplayLabel.font = UIFont(name:nil, size:12.0)
                DisplayLabel.textColor = UIColor.whiteColor()
                DisplayLabel.textAlignment = NSTextAlignment.Center
                self.view.addSubview(DisplayLabel)
            }
        }
        
      
        

        
        //设置返回按钮

        var backButton = UIButton()
        backButton.frame = CGRectMake(260,440,40,20)
        //backButton.backgroundColor = UIColor.blackColor()
        backButton.setTitle("Back", forState:.Normal)
        backButton.titleLabel.font = UIFont.systemFontOfSize(12)
        backButton.addTarget(self, action: "turnBack",forControlEvents:.TouchUpInside)
        self.view.addSubview(backButton)
           
    }
    
        func turnBack() {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

