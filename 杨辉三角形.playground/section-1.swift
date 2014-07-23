// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
var board = Array<Array<Int>> ()
for i in 1...10{
    board.append(Array(count:i,repeatedValue:0))
}
board

for i in 0...9{
    for j in 0...i {
        if i==j||j==0 {
        board[i][j]=1
        } else {
        board[i][j] = board[i-1][j] + board[i-1][j-1]
        }
     }
 }


for i in 0...9 {
    for k in 0...(19-2*i) {
        print(" ")
    }
    for j in 0...i {
       
        print(board[i][j])
        print("   ")
    }
    println("")
}