// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
/*subscript(index:Int)->Int{
    get{
        
    }
    set(newValue){
        
    }
}*/
struct TimesTable {
    let multiplier: Int
    subscript(index:Int)->Int{
        return multiplier*index
    }
}
let threeTimesTable = TimesTable(multiplier:3)
println("3的6倍是18")

var a = Array<Array<Int>>()
var b = Array<Int>()

struct Matrix {
    let rows:Int, columns:Int
    var grid = [Double]()
    init(rows:Int,columns:Int){
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows*columns, repeatedValue:0.0)
    }
        func indexIsValidForRow(row:Int,column:Int)->Bool{
            return row>=0&&row<rows&&column>=0&&column<columns
        }
        subscript(row:Int,column:Int)->Double{
            get {
                assert(indexIsValidForRow(row,column:column),"Index out of range")
                return grid[(row*column)+column]
            }
            set {
                assert(indexIsValidForRow(row,column:column),"Index out of range")
                grid[ (row*columns) + column ] = newValue
        }
    }
}
var matrix = Matrix(rows:2,columns:2)
matrix[0,1] = 1.5
matrix[1,0] = 3.2
matrix












































