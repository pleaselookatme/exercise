// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

enum Planet: Int {
    case Mercury = 1,Venus,Earth,Mars,Jupiter,Saturn,Uranus,Neptune
}
let earthsOrder = Planet.Earth.toRaw()
let possiblePlanet = Planet.fromRaw(7)
println(possiblePlanet)
let positionToFind = 9
if let somePlanet = Planet.fromRaw(positionToFind) {
    switch somePlanet {
    case  .Earth:
        println("Mostly harmless")
    default:
        println("Not a safe place for humans")
    }
} else {
    println("There isn't a planet at position \(positionToFind)")
}

