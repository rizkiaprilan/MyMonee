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

struct LastTransaction {
    var lastDeposit: String = "Rp 0"
    var lastWithdraw: String = "Rp 0"
}

var historyData: [HistoryData] = [
//    HistoryData(title: "Bayar Listrik", extensions: Extensions(statusHistory: .withdraw),price: 256000),
//    HistoryData(title: "Gaji Februari", extensions: Extensions(statusHistory: .deposit),price: 1250000)
]

struct HistoryData {
    let id:String = String(UUID.init().uuidString.uppercased().prefix(6))
    let title: String
    let extensions: Extensions
    let price: Int
    
    init(title:String,extensions:Extensions,price:Int) {
        self.title = title
        self.extensions = extensions
        self.price = price
    }
}

struct HistoryDataAPI: Codable {
    var id:String = String(UUID.init().uuidString.uppercased().prefix(6))
    let title: String
    let extensions: String
    let price: Int
    let date: String
}

struct TypeMoney {
    var withFormatMoney:String
    var withoutFormatMoney:Int
}

// start No. 1
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
// end No.1

// start No.2
extension HistoryData {
    var formatRupiah:String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "id_ID")
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        var result: String = ""
        
        if let formattedTipAmount = formatter.string(from: self.price as NSNumber) {
           result = "Rp \(formattedTipAmount)"
        }
        return result
    }
    var formatDate:String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy - HH.mm"
        let result = formatter.string(from: date)
        return result
    }
}
// end No.2
