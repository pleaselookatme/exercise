// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
for i  in 1...17 {
    for  j in 1...25 {
        for  k in 1...30 {
            if (i*3 + j*2 + k) == 50 && (i + j + k) == 30  {
                println("有\(i)个男人,\(j)个女人和\(k)个小孩 ")
            }
        }
    }
}