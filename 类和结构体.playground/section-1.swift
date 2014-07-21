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


