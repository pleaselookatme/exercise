// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

class Counter {
    var count = 0
    func increment() {
        count++
    }
    func incrementBy(amount: Int ){
        count += amount
    }
    func reset(){
        count = 0
    }
}
let counter = Counter()
for i in 1...3 {
 counter.incrementBy(3)
}
println(counter.count)

class Counter1 {
    var count: Int = 0
    func incrementBy(amount:Int,numberOfTimes:Int){
        count += amount * numberOfTimes
    }
}
let counter1 = Counter1()
counter1.incrementBy(5,  numberOfTimes: 3)
println(counter1.count)


struct Point {
    var x=0.0,y=0.0
    func isToTheRightOfX(x:Double)->Bool{
        return self.x > x
    }
}
let somePoint = Point(x:4.0 ,y:5.0)
if somePoint.isToTheRightOfX(1.0){
    println("This point is to the right of the line where x== 1.0")
}

struct Point1 {
    var x=0.0, y=0.0
    mutating func moveByX(deltaX:Double,y deltaY:Double){
        x += deltaX
        y += deltaY
    }
}












































