// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
for i in 1...9{
    for j in 1...i{
        print("\(j)*\(i)=\(i*j) ")
    }
    print("\n")
}