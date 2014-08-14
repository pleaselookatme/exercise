//
//  main.swift
//  面向对象
//
//  Created by mohoo on 14-8-14.
//  Copyright (c) 2014年 mohoo. All rights reserved.
//  init调入值可以进行赋值，然后init里面的是直接调用的，外面的函数要用类名加点取函数名

import Foundation

class Hello{
    var name:String = "swift"
    
    init(name:String){
        self.name = name
      //  println("Hello init")
    }
    init(){
      
    }
    func sayHello(){
        println("Hello \(name)")
    }
    class func sayHi(){//类方法，静态方法
        println("Hi Swift")
    }
}
class Hi:Hello{//继承了Hello的方法和类
    override func sayHello() {
        super.sayHello()
        println("Hi \(name) hh")
    }
}

extension Hi{
    func sayHaHa(){
        println("HaHa")
    }
}







var h = Hello()//挂号里面的话有值就调用有值的构造，没值就调用没值
h.sayHello()
Hello.sayHi()//可以不用hello()，直接用类名调用就可




var hi = Hi(name:"xiaogang")
hi.sayHello()


var haha = Hi()
haha.sayHaHa()