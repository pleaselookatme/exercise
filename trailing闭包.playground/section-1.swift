// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

let digitNames = [0:"zero",1:"one",2:"two",3:"three",4:"four",5:"five"]
let numbers = [11,12,23]
let strings = numbers.map {
    (var number) -> String in
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}
println(strings)
//trailing 闭包法


