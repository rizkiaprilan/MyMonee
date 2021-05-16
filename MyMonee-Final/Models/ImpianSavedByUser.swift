//
//  ImpianSavedByUser.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 13/05/21.
//

import Foundation

struct ImpianByUser {
    var id:String = UUID.init().uuidString
    var title:String
    var progress:Float
    var amount:Amount
    var amountString:String
    init(title:String,amount:Amount) {
        self.amountString = "IDR \(convertIntToFormatMoneyRaw(money:amount.current)) / IDR \(convertIntToFormatMoneyRaw(money: amount.target))"
        self.title = title
        self.progress = Float(amount.current)/Float(amount.target)
        self.amount = amount
    }
}

struct Amount{
    var current:Int
    var target:Int
}

var dataImpianByUser: [[ImpianByUser]] = [
    [ImpianByUser(title: "Membeli Mobil", amount: Amount(current: 1000000000, target: 2000000000))],
    [ImpianByUser(title: "Membeli Rumah", amount: Amount(current: 2000000000, target: 10000000000))],
    [ImpianByUser(title: "Beli Macbook Pro", amount: Amount(current: 25000000, target: 25000000))],
    [ImpianByUser(title: "Beli Permen", amount: Amount(current: 10000, target: 10000))]
]
