// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*protocol SomeProtocol {
    var musBeSettable :Int{get set}
    var doesNotNeedToBeSettable:Int{get}
}
protocol AnotherProtocol {
    class var someTyoeProperty:Int {get set}
    
}*/
protocol FullyNamed {
    var fullName:String{get}
}

struct Person: FullyNamed{
    var fullName:String
}
let john = Person(fullName: "John Appleseed")

class Starship:FullyNamed{
    var prefix:String?
    var name:String
    init(name:String,prefix:String? = nil){
        self.name = name
        self.prefix = prefix
    }
    var fullName:String {
   return (prefix ? prefix!  + " " : " ") + name
  
    }
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
ncc1701.fullName
protocol SomeProtocol{
    class func someTypeMethod()
    
}
protocol RandomNumberGenerator {
    func random() -> Double
}
//LinearCongruentialGenerator 0.。。1随机数调用
class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom*a + c) % m)
        return lastRandom / m
    }
}
    let generator = LinearCongruentialGenerator()
println("Here's a random number:\(generator.random())")
println("And another one:\(generator.random())")




protocol Togglable {
    mutating func toggle()
}
//OnOffSwitch
enum  OnOffSwitch: Togglable{
    case Off,On
    mutating func toggle(){
        switch self {
        case Off:
            self = On
        case On:
            self = Off
        }
    }
}
var lightSwitch = OnOffSwitch.Off
lightSwitch.toggle()
println(lightSwitch)

class Dice {
    let sides:Int
    let genetator:RandomNumberGenerator
    init(sides:Int, genetator:RandomNumberGenerator) {
        self.sides = sides
        self.genetator = genetator
        
    }
    func roll() -> Int{
        return Int(genetator.random()*Double(sides))+1
    }
}

var d6 = Dice(sides: 6, genetator: LinearCongruentialGenerator())
for _ in 1...5{
    println("Random dice roll is \(d6.roll())")
}
generator.random()
generator.random()
generator.random()
generator.random()
generator.random()
generator.random()
generator.random()
protocol DiceGame {
    var dice:Dice{get}
    func play()
}
protocol DiceGameDelegate{
    func gameDidStart(game:DiceGame)
    func game(game:DiceGame,didStartNewTurnWithDiceRoll diceRoll:Int)
    func gameDidEnd(game:DiceGame)
}
class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, genetator: LinearCongruentialGenerator())
    var square = 0
    var board:[Int]
    init(){
        board = [Int](count:finalSquare + 1, repeatedValue:0)
        board[03] = +08;board[06] = +11;board[09] = +09;board[10] = +02
        board[14] = -10;board[19] = -11;board[22] = -02;board[24] = -08
    }
    var delegate:DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop:while square != finalSquare{
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll{
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
   }

}

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
