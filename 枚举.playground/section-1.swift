// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

enum Swiftmember {
    case xiaogang
    case susu
    case zhangjie
    case xuyajie
}
enum Others {
    case cat,dog,chicken
}
let someone = Others.cat
var girl1 = Swiftmember.susu
switch girl1 {
case .xiaogang:
println("he is a boy")
case .susu:
println("she is a manlike girl")
case .xuyajie:
println("she is a sister")
case .zhangjie:
println("she is my classmate")
}
switch someone {
case .cat:
    println("it is a pretty animal")
default :
    println("it is not  a animal")
}

