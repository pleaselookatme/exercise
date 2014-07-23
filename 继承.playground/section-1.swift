// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
class Vehicle {
    var numberOfWheels:Int
    var maxPassengers:Int
    func description()->String{
        return "\(numberOfWheels) wheels; up to \(maxPassengers) passengers"
    }
    init(){
    numberOfWheels = 0
    maxPassengers = 1
    }
}
let someVehicle = Vehicle()
class Bicycle: Vehicle {
    init(){
        super.init()
        numberOfWheels = 2
    }
}
let bicycle = Bicycle()
println("Bicycle: \(bicycle.description())")
class Tandem:Bicycle{
    init(){
        super.init()
        maxPassengers = 2
    }
}
let tandem = Tandem()
println("Tandem:\(tandem.description())")


/*   重写                */
class Car: Vehicle {
    var speed:Double = 0.0
    init(){
        super.init()
        maxPassengers = 5
        numberOfWheels = 4
    }
    override func description()->String{
        return super.description() + ";" + "traveling at \(speed) mph"
    }
}
let car = Car()
println("Car: \(car.description())")

class SpeedlimitedCar: Car {
    override var speed: Double {
    get{
        return super.speed
    }
    set{
        super.speed = min(newValue,40.0)
    }
    }
}
let limitedCar = SpeedlimitedCar()
limitedCar.speed = 60
println("SpeedLimitedCar: 4 wheels; up to 5 passengers; traveling at 40.0 mph")
class AutomaticCar: Car {
    var gear = 1
    override var speed: Double {
    didSet {
        gear = Int(speed/10.0)+1
    }
    }
    override func description()->String{
        return super.description()+"in gear \(gear)"
    }
}
let automatic = AutomaticCar()
automatic.speed = 35.0
println("AutomaticCar : \(automatic.description())")









































