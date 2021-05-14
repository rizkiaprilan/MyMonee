//
//  HistoryTransaction.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 12/05/21.
//

import Foundation

struct Extensions{
    let image:String
    let fontColor:String
    let status: TypeHistory
    
    init(statusHistory: TypeHistory) {
        self.status = statusHistory
        switch statusHistory{
        case .deposit:
            self.image = "Arrow_Up_2"
            self.fontColor = "Deposit"
        case .withdraw:
            self.image = "Arrow_Down_2"
            self.fontColor = "Withdraw"
        }
    }
}

enum TypeHistory: String{
    case deposit
    case withdraw
}

struct HistoryData {
    let title: String
    let date: String
    let extensions: Extensions
    let price: Int
    
}

struct LastTransaction {
    var lastDeposit: String = "-"
    var lastWithdraw: String = "-"
}


let historyData: [HistoryData] = [
    HistoryData(title: "Bayar Listrik", date: "1 Mei 2021 - 19.30", extensions: Extensions(statusHistory: .withdraw),price: 256000),
    HistoryData(title: "Gaji Februari", date: "2 Mei 2021 - 19.30", extensions: Extensions(statusHistory: .deposit),price: 1250000)
]


func getBalance() -> String {
    var result:Int = 0
    for value in historyData {
        switch value.extensions.status{
        case .deposit:
            result+=value.price
        case .withdraw:
            result-=value.price
        }
    }
    return convertIntToFormatMoney(money: result, isDepoOrWithdraw: nil)
}

func getLastDepoAndWithdraw() -> LastTransaction{
    var result:LastTransaction = LastTransaction()
    
    historyData.forEach { (value: HistoryData) in
        switch value.extensions.status{
        case .deposit:
            result.lastDeposit = convertIntToFormatMoney(money: value.price, isDepoOrWithdraw: nil)
        case .withdraw:
            result.lastWithdraw = convertIntToFormatMoney(money: value.price, isDepoOrWithdraw: nil)
        }
    }
    
//    for value in historyData {
//        switch value.extensions.status{
//        case .deposit:
//            result.lastDeposit = convertIntToFormatMoney(money: value.price, isDepoOrWithdraw: nil)
//        case .withdraw:
//            result.lastWithdraw = convertIntToFormatMoney(money: value.price, isDepoOrWithdraw: nil)
//        }
//    }
    
    return result
}
