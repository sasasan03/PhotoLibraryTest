import UIKit
import SwiftUI
import Foundation
import PlaygroundSupport


//-----------------------------------------コンピューテッドプロパティ
//struct Person {
//    var firstName: String
//    var lastName: String
//    var fullName: String {
//        get{
//            "\(firstName)\(lastName)"
//        }
//        set(newFullName){
//            //⭐️fullnameをSubSequenceにする。
//            let nameConponents = newFullName.split(separator: " ")
//            if nameConponents.count == 2 {
//                firstName = String(nameConponents[0])
//                lastName = String(nameConponents[1])
//                print(firstName)
//                print(lastName)
//            }
//        }
//    }
//}

//var sako = Person(firstName: "sakoda", lastName: "hiromichi")
//sako.fullName = "gyouden hiromichi"
//
//struct Rectangle {
//    var width: Double
//    var height: Double
//
//    var area: Double {
//        get {
//            return width * height
//        }
//        set(newArea) {
//            let sideLength = sqrt(newArea)
//            width = sideLength
//            height = sideLength
//            print("width is \(width)")
//            print("height is \(height)")
//        }
//    }
//}
//
//var myRectangele = Rectangle(width: 20, height: 30)
//print("Area is \(myRectangele.area)")//Area is 600.0
//myRectangele.area = 121//　値が更新される。


//----------------------------------------------
//struct MyStruct: CustomStringConvertible {
//
//    var description: String {
//        "priceは：\(price)"
//    }
//
//    var price: Double {
//        didSet {
//            print("didSet called: \(price)")
//            if price > 100 {
//                print("Adjusting price to be under 100")
//                price = 100  // didSetは再帰的に呼ばれない
//            }
//        }
//    }
//}
//
//func adjustPrice(_ value: inout Double) {
//    print("Function called: \(value)")
//    value += 50
//}
//
//// didSetのテスト
//var myItem = MyStruct(price: 50)
//myItem.price = 200  // didSetが呼ばれ、値が100に調整される
//// inout引数とdidSetのテスト
//print("Before function call: \(myItem.price)")
//adjustPrice(&myItem.price)  // 関数から戻った後にdidSetが呼ばれる
//print("After function call: \(myItem.price)")


//--------------------------------------------------------------
//var プロパティ名：型 = 初期値 {
//    willSet(仮引数){
//        値が更新される直前に呼ばれる文
//    }
//    didSet(仮引数){
//        値が更新された直後に呼ばれるぶん
//    }
//}
//--------------------------------------------------------------


//struct Stock: CustomStringConvertible {
//    var description: String {
//        "buyingPriceは\(buyingPrice)。highは\(high)。countは\(count)。priceは\(price)"
//    }
//
//    let buyingPrice: Int
//    var high = false
//    var count = 0
//    init(price: Int){
//        buyingPrice = price
//        self.price = price
//    }
//    var price: Int {
//        willSet(oNew) {
//            count += 1
//            high = oNew > buyingPrice
//        }
//        didSet(ooldValue) {
//            print("\(ooldValue) => \(price)")
//        }
//    }
//}
//
//var stock = Stock(price: 100)
//stock.price = 150
//stock.high = false
//stock.high = true
//stock.price = 200


