// Playground - noun: a place where people can play

import Cocoa

var board = Array(count : 100, repeatedValue: 0)
for i in 0...99 {
    board[i] = Int(arc4random()%10000)
}
var  i = 0, j = 0 ,temp = 0
for  i = 0; i < 100;i++  {
    
    for  j = i+1;j<100;j++ {
        if board[j] < board[i] {
        temp = board[i]
        board[i] = board[j]
        board[j] = temp
       }
    }
}
for i in 0...99 {
    print("\(board[i]) ")
   
}
