// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
var day = 0
var board = [1992,6,20]
var monthp = [31,28,31,30,31,30,31,31,30,31,30,31]
var monthr = [31,29,31,30,31,30,31,31,30,31,30,31]
if board[0]%400 == 0 || (board[0]%4 == 0 && board[0]%100 != 0) {
    for i in 0..(board[1]-1) {
        day += monthr[i]
    }
    day += board[2]
    
} else {
    for i in 0..(board[1]-1) {
        day += monthp[i]
    }
    day += board[2]
}

println("\(board[0])年\(board[1])月\(board[2])日是那年的第\(day)天！")