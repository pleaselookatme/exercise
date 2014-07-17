// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

var i = 450000
var galary: Double = 0
switch i {
case 0..100000:
     galary = Double(i) * 0.1
case 100000..200000:
    galary = Double(i-100000) * 0.075 + 100000 * 0.1
case 200000..400000:
    galary = Double(i - 200000 ) * 0.05 + 100000 * 0.175
case 400000..600000:
    galary = Double(i - 400000 ) * 0.03 + 200000 * 0.05 + 100000 * 0.175
case 600000..1000000:
    galary = Double(i - 600000) * 0.015 + 200000 * 0.08 + 100000 * 0.175
default:
    galary = Double(i - 1000000) * 0.01 + 400000*0.015 + 200000*0.08 + 100000*0.175
}
println(galary)
