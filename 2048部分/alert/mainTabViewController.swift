//
//  mainTabViewController.swift
//  alert
//
//  Created by mohoo on 14-8-6.
//  Copyright (c) 2014年 mohoo. All rights reserved.
//

import Foundation
import UIKit
class mainTabViewController:UITabBarController{
    //init 使得多个页面选择项
    init(){
        super.init(nibName: nil, bundle: nil)
        var viewMain = mainViewController()
        viewMain.title = "2048"
        var viewSetting = settingViewController()
        viewSetting.title = "设置"
        //视图导航控制器
        var main = UINavigationController(rootViewController: viewMain)
        var setting = UINavigationController(rootViewController: viewSetting)
        //视图选项控制器数组
        self.viewControllers = [main,setting]
        self.selectedIndex = 0
    }
}