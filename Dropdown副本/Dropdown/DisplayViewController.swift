//
//  File.swift
//  Dropdown
//
//  Created by mohoo on 14-8-4.
//  Copyright (c) 2014年 mohoo. All rights reserved.
//
import Foundation
import UIKit

class DisplayViewController: UIViewController  {
   
    var gradeChoose = String()
    
    override func viewDidLoad() {
        println(gradeChoose)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.blueColor()
        var nameLabel = UILabel()
        nameLabel.frame = CGRectMake(15.0, 20.0, 40.0, 20.0)
        nameLabel.text = "Name:"
        nameLabel.font = UIFont(name:nil, size:12.0)
        nameLabel.textColor = UIColor.whiteColor()
        nameLabel.textAlignment = NSTextAlignment.Left
        self.view.addSubview(nameLabel)
        var backButton = UIButton()
        backButton.frame = CGRectMake(260,440,40,20)
        //backButton.backgroundColor = UIColor.blackColor()
        backButton.setTitle("返回", forState:.Normal)
        backButton.titleLabel.font = UIFont.systemFontOfSize(12)
        backButton.addTarget(self, action: "turnBack",forControlEvents:.TouchUpInside)
        self.view.addSubview(backButton)
        var gradeLable = UILabel()
        gradeLable.frame = CGRectMake(40, 40, 40, 20)
        gradeLable.text = gradeChoose
        gradeLable.font = UIFont(name:nil,size:12.0)
        gradeLable.textColor = UIColor.whiteColor()
       gradeLable.textAlignment = NSTextAlignment.Center
        self.view.addSubview(gradeLable)
    }
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func turnBack() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    
}
