// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
func makeIncrementor(forIncrement amount :Int)->() ->Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return  incrementor
}
let  incrementByTen = makeIncrementor(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()
let incrementBySeven = makeIncrementor(forIncrement: 7)
incrementBySeven()
incrementByTen()
incrementBySeven()
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()





class Person {    let name: String    init(name: String) {    self.name = name    println("\(name) is being initialized")    }    deinit {    println("\(name) is being deinitialized")    }}var reference1: Person?var reference2: Person?var reference3: Person?reference1 = Person(name: "John Appleseed")reference2 = reference1reference3 = reference1reference1 = nilreference2 = nilreference3 = nil