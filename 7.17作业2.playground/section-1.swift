// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

var board = [89,92,93,78,76,38,94,77,88,67]
var temp = 0 , max = 0, min = 100,sum = 0
for i in 0...9 {
    sum += board[i]
    if board[i] > max {
        max = board[i]
    }
    if board[i] < min {
        min = board[i]
    }
}
min
sum = sum - max - min
println("歌手的平均成绩为\(Float(sum/8))")


