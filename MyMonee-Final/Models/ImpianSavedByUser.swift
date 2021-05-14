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
    var amount:String
    
//    init(title:String,progress:Float,amount:String) {
//        self.id = UUID.init().uuidString
//        self.title = title
//        self.progress = progress
//        self.amount = amount
//    }
}


let dataImpianByUser: [ImpianByUser] = [
    ImpianByUser(title: "Membeli Mobil", progress: 0.5, amount: "IDR 1.000.000.000 / IDR 2.000.000.000")
//    ImpianByUser(title: "Membeli Rumah", progress: 0.2, amount: "IDR 2.000.000.000 / IDR 10.000.000.000"),
//    ImpianByUser(title: "Membeli Macbook Pro", progress: 1, amount: "IDR 25.000.000 / IDR 25.000.000")
]
