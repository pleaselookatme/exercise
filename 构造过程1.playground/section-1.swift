// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
class Food {
    var name: String
    init(name:String){
        self.name = name
    }
    convenience init(){
        self.init(name:"[Unnamed]")
    }
}
let namedMeat = Food(name:"Bacon")
let mysteryMeat = Food()
class RecipeIngredient: Food{
    var quantity: Int
init(name:String,quantity:Int){
        self.quantity = quantity
    super.init(name:name)
    }
    convenience init(name:String){
        self.init(name:name, quantity:1)
    }
}
let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name:"Bacon")
let sixEggs = RecipeIngredient(name:"Eggs",quantity:6)
class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String{
    var output = "\(quantity) x \(name.lowercaseString)"
        output += purchased ? "√":"×"
        return output
    }
}
var breakfastList = [
ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name:"Eggs",quantity:6)]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    println(item.description)
}



struct Checkerboard{
    let boardColors: Bool[] = {
var temporaryBoard = [Bool]()
    var isBlack = false
        for i in 1...10{
            for j in 1...10{
            temporaryBoard.append(isBlack)
            isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
}()
    func squareIsBlackAtRow(row:Int, column:Int)->Bool{
        return boardColors[(row*10)+column]
}
}
let board = Checkerboard()
println(board.squareIsBlackAtRow(0,column:1))
println(board.squareIsBlackAtRow(9,column:9))
































