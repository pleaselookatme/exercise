// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    println("on the x-axis with an x value of \(x)")
case (0, let y):
    println("on the y-axis with an x value of \(y)")
case let (x, y):
    println("somewhere else at (\(x),\(y))")
}

let pu = "great mind think alike"
var puout = ""
for character in pu {
    switch  character {
        case "a" , "e", "i", "o" ,"u"," ":
        continue
    default:
        puout += character
    }
}
println(puout)

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch  integerToDescribe {
case 5, 7:
    description += "a prime number , and also"
    fallthrough
default :
    description += "an integer."
}
println(description)

// gameLoop : while square != finalSquare {}

