// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

struct Bank {
    static var coinsInBank = 10_000
    static func vendCoins(var numberOfCoinsToVend:Int)->Int {
        numberOfCoinsToVend = min(numberOfCoinsToVend,coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receiveCoins(coins:Int){
        coinsInBank += coins
    }
}
class Player {
    var coinsInPurse: Int
    init(coins:Int){
        coinsInPurse = Bank.vendCoins(coins)
    }
    func winCoins(coins:Int){
        coinsInPurse += Bank.vendCoins(coins)
    }
    deinit {
        Bank.receiveCoins(coinsInPurse)
    }
}
var playerOne:Player? = Player(coins:100)
println("A new player has joined the game wuth \(playerOne!.coinsInPurse) coins")
println("There are now \(Bank.coinsInBank) coins left in the bank")
playerOne!.winCoins(2_000)
println("PlayerOne  won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
println("The bank now only has \(Bank.coinsInBank) coins left")
playerOne = nil
println("PlayerOne has left the game")
println("The bank now has \(Bank.coinsInBank) coins")
