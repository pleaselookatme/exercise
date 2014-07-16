// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


for i in 1...5 {
    for k in 1...(10-2*i) {
        print("  ")
    }
    for j in 1...(2*i-1) {
        print("*\t")
    }
    println("\n")
}

for i in 1...9{
    for j in 1...i{
        print("\(i)*\(j)=\(i*j)\t")
    }
    print("\n")
}

let contenHight = 40
let hasHeader = true
let rowHight = contenHight + (hasHeader ? 50:20)

print("lixiaogang\n")
println("lixiaogang")

println("li")
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSign = "\x24"
let blackHeart = "\u2665"
let sparklingHeart = "\U0001F496"
var emptyString = ""
var anotherEmptyString = String()
if emptyString.isEmpty {
    println("Nothing to see here")
}
var dd = "have"
dd += " a dog"
for character in "have a dog"{
    println(character)
}
let ds = "dsadsadsadsa"
println("\(countElements(ds))")

let string1 = "hello"
let string2 = " there"
let ch1: Character = "!"
let ch2: Character = "?"
let Plusch = string1 + ch1
let Plusst = string1 + string2
let Plusct = ch1 + string1
let Pluscc = ch1 + ch2
let mul = 3
let mes = "(mul) times 2.5 is \(Double(mul)*2.5)"







































