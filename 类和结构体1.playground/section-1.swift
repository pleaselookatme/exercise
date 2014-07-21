// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
let someResolution = Resolution()
let someVideoMode = VideoMode()
println("The width of someResolution is \(someResolution.width)")
println("The width of someVideoMode is \(someVideoMode.resolution.width)")
someVideoMode.resolution.width = 1280
println("The width of someVideoMode is mow \(someVideoMode.resolution.width)")

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
println("cinema is now \(cinema.width) pixels wide")
println("hd is still \(hd.width) pixels wide")
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
println("The frameRate property of tennEighty is now \(tenEighty.frameRate)")
if tenEighty === alsoTenEighty{
    println("tenEighty and alsoTenEighty refer to the same Resolution instance.")
}