import UIKit
import SwiftUI
import Foundation
import PlaygroundSupport

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

struct Stock: CustomStringConvertible {
    var description: String {
        "buyingPriceは\(buyingPrice)。highは\(high)。countは\(count)。priceは\(price)"
    }
    
    let buyingPrice: Int
    var high = false
    var count = 0
    init(price: Int){
        buyingPrice = price
        self.price = price
    }
    var price: Int {
        willSet(oNew) {
            count += 1
            high = oNew > buyingPrice
        }
        didSet(ooldValue) {
            print("\(ooldValue) => \(price)")
        }
    }
}

var stock = Stock(price: 100)
stock.price = 150
stock.high = false
stock.high = true
stock.price = 200



//var fruits = ["りんご","ぶどう","オレンジ"]{
//    didSet {
//        oldValue.forEach { fruit in
//            print(fruit)
//        }
//    }
//}


