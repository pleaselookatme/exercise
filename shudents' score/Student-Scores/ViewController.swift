//
//  ViewController.swift
//  Student-Scores
//
//  Created by hy on 14-7-29.
//  Copyright (c) 2014年 hy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var DisView = DisViewController()
    var dis = Array<NSString>()
    var userdata = NSArray()
    var userid = NSString()
    var student = NSDictionary()
    
    @IBOutlet weak var userinput: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func LoginNext(sender: AnyObject) {
        var DisView = DisViewController()
        userid = userinput.text
        loaddata(userid)
         DisView.dis = self.dis
       DisView.userid = self.userid
            self.dis = Array<NSString>()
    
        if judgement() {
                self.presentViewController(DisView , animated: true, completion: nil)   //跳转到第二页
            }
        
    }
    
  //传值
    func loaddata(userid:String){
        if  userid > "5"||userid < "0" {
        //if userid != "1" {
            var alert = UIAlertController(title: "提示", message: "输入错误！", preferredStyle: .Alert)
            var actionback = UIAlertAction(title: "重新输入", style: .Default, handler: {act in
                self.dismissViewControllerAnimated(true, completion: nil)
                })
            alert.addAction(actionback)
            self.presentViewController(alert, animated: true, completion: nil)
        }else{
            var geturl = "http://192.168.0.12/student/openapi.php?id=" + "\(userid)"
            var url = NSURL(string: geturl)
            var data = NSData.dataWithContentsOfURL(url, options: NSDataReadingOptions.DataReadingUncached, error:nil)
            var json: AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil)
            var studentInfo: AnyObject! = json.objectForKey("student")
            println(studentInfo)
            var student = studentInfo as NSDictionary
            userdata = studentInfo.objectForKey("data") as NSArray
            var count = userdata.count
            var array = userdata as Array
           for i in 0..<count{
                for app in array[i] as NSDictionary{
                    var infor: AnyObject = app.value
                  dis.append(infor as NSString)
                }
           }
           
        }
        
    }
/*var geturl = "http://192.168.0.12/student/openapi.php?id=" + "\(userid)"
var url = NSURL(string: geturl)
println(url)
var data = NSData.dataWithContentsOfURL(url, options: NSDataReadingOptions.DataReadingUncached, error:nil)
var json: AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil)
var studentInfo = json.objectForKey("student") as NSDictionary
println(studentInfo)
var userdata =  studentInfo.objectForKey("data") as NSArray
var count = userdata.count
var array = userdata as Array
var dis = Array<NSString>()
for i in 0...count{
//for app in array[1].values as NSDicti{
for app in array[1] as NSDictionary{
var infor: AnyObject = app.value
dis.append("\(infor)")
}
}*/
    func judgement() -> Bool{
        if userdata != nil{
            return true
        }
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        textField.resignFirstResponder()
        return true
    }

}

