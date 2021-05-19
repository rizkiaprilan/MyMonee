//
//  HistoryTransaction.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 12/05/21.
//

import Foundation

struct Extensions {
    let image:String
    let fontColor:String
    let status: TypeHistory
    
    init(statusHistory: TypeHistory) {
        self.status = statusHistory
        switch statusHistory {
        case .deposit:
            self.image = "Arrow_Up_2"
            self.fontColor = "Deposit"
        case .withdraw:
            self.image = "Arrow_Down_2"
            self.fontColor = "Withdraw"
        }
    }
}

enum TypeHistory: String {
    case deposit
    case withdraw
}

//protocol convertion {
//    var formatRupiah:String{get}
//    var formatDate:String{get}
//}

struct HistoryData {
    let id:String = String(UUID.init().uuidString.uppercased().prefix(6))
    let title: String
    let date: String
    let extensions: Extensions
    let price: Int
    
    init(title:String,date:String,extensions:Extensions,price:Int) {
        self.title = title
        self.date = date
        self.extensions = extensions
        self.price = price
    }
}



struct LastTransaction {
    var lastDeposit: String = "Rp 0"
    var lastWithdraw: String = "Rp 0"
}

var historyData: [HistoryData] = [
    HistoryData(title: "Bayar Listrik", date: "1 May 2021 - 19.30", extensions: Extensions(statusHistory: .withdraw),price: 256000),
    HistoryData(title: "Gaji Februari", date: "2 May 2021 - 19.30", extensions: Extensions(statusHistory: .deposit),price: 1250000)
]

func getBalance() -> TypeMoney {
    let total = historyData.map { (value) -> Int in
        return value.extensions.status == .withdraw ? -value.price : value.price
    }.reduce(0, +)
    
    return TypeMoney(withFormatMoney: convertIntToFormatMoney(money: total, isDepoOrWithdraw: nil), withoutFormatMoney: total)
}

func getLastDepoAndWithdraw() -> LastTransaction {
    var result:LastTransaction = LastTransaction()
    historyData.reversed().forEach { (value: HistoryData) in
        if value.extensions.status == .deposit && result.lastDeposit == "Rp 0" {
            result.lastDeposit = convertIntToFormatMoney(money: value.price, isDepoOrWithdraw: nil)
        }
        if value.extensions.status == .withdraw && result.lastWithdraw == "Rp 0" {
            result.lastWithdraw = convertIntToFormatMoney(money: value.price, isDepoOrWithdraw: nil)
        }
    }
    return result
}

struct TypeMoney {
    var withFormatMoney:String
    var withoutFormatMoney:Int
}
