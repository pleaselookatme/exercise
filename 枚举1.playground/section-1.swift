// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
enum Barcode {
    case UPCA(Int ,Int ,Int )
    case QRCode(String)
}
var productBarcode = Barcode.UPCA(8, 85909_51226, 3)
productBarcode =  .QRCode("ABCDEFGHIJKLMNOP")
switch productBarcode {
case  .UPCA(let numberSystem, let identifier, let check):
    println("UPC-A with value of \(numberSystem),\(identifier),\(check).")
case  .QRCode(let productCode):
    println("QR code with value of \(productCode).")
}



