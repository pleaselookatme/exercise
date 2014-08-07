//
//  ViewController.swift
//  alert
//
//  Created by mohoo on 14-8-6.
//  Copyright (c) 2014年 mohoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func startGame(sender:UIButton){
        let alertView  = UIAlertView(title: "开始！", message: "游戏即将开始！", delegate: self, cancelButtonTitle: "Readygo!")
        alertView.show()
    }
    func alertView(alertView:UIAlertView, clickedButtonAtIndex buttonIndex:Int){
        self.presentViewController(mainTabViewController(),animated:true,completion:nil)
    }

}

