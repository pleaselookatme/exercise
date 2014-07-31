// Playground - noun: a place where people can play

import UIKit
/*
var userid = 101010100
var geturl = "http://www.weather.com.cn/data/sk/" + "\(userid)" + ".html"
var url = NSURL(string: "\(geturl)")
var data =  NSData.dataWithContentsOfURL(url, options: NSDataReadingOptions.DataReadingUncached, error: nil)
var json: AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil)
var weatherInfo: AnyObject! = json.objectForKey("weatherinfo")
var weatherInto: AnyObject! = weatherInfo.objectForKey("city")
println(json)
*/

var userid = 1
var geturl = "http://192.168.0.12/student/openapi.php?id=" + "\(userid)"
var url = NSURL(string: geturl)
println(url)
var data = NSData.dataWithContentsOfURL(url, options: NSDataReadingOptions.DataReadingUncached, error:nil)
var json: AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil)
var studentInfo = json.objectForKey("student") as NSDictionary
println(studentInfo)
var info =  studentInfo.objectForKey("data") as NSArray
var count = info.count
var array = info as Array
var dis = Array<NSString>()
for i in 0..<count{
    //for app in array[1].values as NSDicti{
for app in array[i] as NSDictionary{
    var infor: AnyObject = app.value
    dis.append(infor as NSString)
 }
}
dis
   
