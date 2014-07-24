// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
class Person {
    let name: String
    init(name: String){
        self.name = name
        println("\(name) is being initialized")
    }
    deinit {
        println("\(name) is being deinitialized")
    }
}
var reference1: Person?
var reference2: Person?
var reference3: Person?
reference1 = Person(name:"John Appleseed")
reference2 = reference1
reference3 = reference1
reference1 = nil
reference2 = nil
reference3 = nil

class Person1 {
    let name:String
    init(name:String){
        self.name = name
}
    var apartment: Apartment?
    deinit{
        println("\(name) is being deinitialized")
          }
}
class Apartment {
    let number: Int
    init(number:Int){
        self.number = number
    }
    var tenant: Person1?
    deinit {
        println("Apartment #\(number) is being deinitialized")
        
    }
}

var john: Person1?
var number73: Apartment?
john = Person1(name: "John Applessed")
number73 = Apartment(number:73)
john!.apartment = number73
number73!.tenant = john
john = nil
number73 = nil

class Person2{
    let name:String
    init(name:String){
        self.name = name
    }
    var apartment2:Apartment2?
    deinit{
        println("\(name) is being deinitialized")
    }
}
class Apartment2 {
    let number:Int
    init(number:Int){
    self.number = number
}
    weak var tenant: Person2?
    deinit {
        println("Apartment #\(number) is being deinitialized")
    }
}
var john1: Person2?
var number731:Apartment2?
john1 = Person2(name:"John Appleseed")
number731 = Apartment2(number:73)
john1!.apartment2 = number731
number731!.tenant = john1






























