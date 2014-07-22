// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
    return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width:4.0,height:5.0,depth:2.0)
println("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")




class StepCounter {
    var totalSteps: Int = 0 {
    willSet(newTotalSteps){
        println("About to set totalSteps to  \(newTotalSteps)")
    }
    didSet {
        if totalSteps > oldValue {
            println("added \(totalSteps-oldValue) steps")
        }
    }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896

struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
   return 10
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
return 2
    }
}
class SomeClass {
    class var computedTypeProperty: Int {
 return 42
    }
}
println(SomeClass.computedTypeProperty)
println(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "Another value "
println(SomeStructure.storedTypeProperty)


struct AudioChannel {
  static let thresholdLevel = 10
  static var maxInputLevelForAllChannels  = 0
    var currentLevel: Int = 0 {
    didSet {
        if currentLevel > AudioChannel.thresholdLevel {//将新电平设置为阈值
            currentLevel = AudioChannel.thresholdLevel
        }
        if currentLevel > AudioChannel.maxInputLevelForAllChannels  {
            AudioChannel.maxInputLevelForAllChannels = currentLevel//存储当前电平值作为新的最大输入电平
        }
    }
    }
}
var leftChannel = AudioChannel()
var rightChannel = AudioChannel()
leftChannel.currentLevel = 7
println(leftChannel.currentLevel)
println(AudioChannel.maxInputLevelForAllChannels)
rightChannel.currentLevel = 11
println(rightChannel.currentLevel)
println(AudioChannel.maxInputLevelForAllChannels)











































