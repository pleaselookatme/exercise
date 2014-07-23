// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
struct Fahrenheit {
    var temperature:Double
    init(){
        temperature = 32.0
    }
}
var f = Fahrenheit()
println("The default temperature is \(f.temperature) degree Fahrenheit")
struct Celsius {
    var temperatureInCelsius: Double = 0.0
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin :Double ){
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit:212.0)
let freezingPointOfWater = Celsius(fromKelvin:273.15)


struct Color {
    let red = 0.0,green=0.0,blue=0.0
    init(red:Double, green: Double, blue:Double){
        self.red = red
        self.green = green
        self.blue =  blue
    }
}
let magenta = Color(red:1.0 ,green:0.0, blue:1.0)
let veryGreen = Color(red: 0.0, green: 1.0, blue: 0.0)

/*class SurveyQuestion {
    var text: String
    var response: String?
    init(text:String){
        self.text = text
    }
    func ask(){
        println(text)
    }
}
let cheeseQuestion = SurveyQuestion(text:"Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese"*/


class SurveyQuestion {
let  text: String
var response: String?
init(text:String){
self.text = text
}
func ask(){
println(text)
}
}
let beetsQuestion = SurveyQuestion(text: "How about beets?")
beetsQuestion.ask()
beetsQuestion.response = "I also like cheese."

class ShoppingListItem {
    var name:String?
    var quantity=1
    var purchased = false
}
var item = ShoppingListItem()


struct Size {
    var width=0.0, height=0.0
}
struct Point{
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    init(){}
    init(origin:Point, size:Size){
        self.origin = origin
        self.size = size
    }
    init(center:Point, size:Size){
        let originX = center.x - (size.width/2)
        let originY = center.y - (size.height/2)
        self.init(origin:Point(x:originX,y:originY),size:size)
    }
}
let basicRect =  Rect()//初始化
let originRect = Rect(origin: Point(x:2.0,y:2.0),size:Size(width:5.0,height:5.0))
let centerRect = Rect(center: Point(x:4.0,y:4.0),size:Size(width:3.0,height:3.0))

/*init(parameters){
    statements
}*/



































