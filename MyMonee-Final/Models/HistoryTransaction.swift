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
    
    init(statusHistory: TypeHistory) {
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
    let price: String
    
}


let historyData: [HistoryData] = [
    HistoryData(title: "Bayar Listrik", date: "1 Mei 2021 - 19.30", extensions: Extensions(statusHistory: .withdraw),price: "-Rp 256.000"),
    HistoryData(title: "Gaji Februari", date: "2 Mei 2021 - 19.30", extensions: Extensions(statusHistory: .deposit),price: "+Rp 1.250.000")
]
