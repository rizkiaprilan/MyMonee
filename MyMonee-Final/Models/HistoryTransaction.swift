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
//    HistoryData(title: "Gaji Februari", date: "2 May 2021 - 19.30", extensions: Extensions(statusHistory: .deposit),price: 1250000)
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
    return result
}

protocol HistoryUserData{
    func getBalance() -> String
    func getLastDepositAndWithdraw() -> LastTransaction
}

class UserData: HistoryUserData {
    let id:String = UUID.init().uuidString.uppercased()
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
    
    func getLastDepositAndWithdraw() -> LastTransaction {
        var result:LastTransaction = LastTransaction()
        
        historyData.forEach { (value: HistoryData) in
            switch value.extensions.status{
            case .deposit:
                result.lastDeposit = convertIntToFormatMoney(money: value.price, isDepoOrWithdraw: nil)
            case .withdraw:
                result.lastWithdraw = convertIntToFormatMoney(money: value.price, isDepoOrWithdraw: nil)
            }
        }
        return result
    }
}

