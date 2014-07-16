// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

let finalSquare = 25
var board = Int[](count: finalSquare + 1, repeatedValue: 0)
board[03] = +08
board[06] = +11
board[09] = +09
board[10] = +02
board[14] = -10
board[19] = -11
board[22] = -2
board[24] = -08
var square = 0
var diceRoll = 0
while square < finalSquare {
    if ++diceRoll == 7 {diceRoll = 1}
    square += diceRoll
    if square < board.count {
        square += board[square]
    }
}
println("Game over!")

