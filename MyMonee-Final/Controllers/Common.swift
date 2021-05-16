//
//  Common.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 12/05/21.
//

import Foundation



func getCurrentDayTime() -> String{
    let date = Date()
    var calendar = Calendar.current
    if let timeZone = TimeZone(identifier: "WIB") {
        calendar.timeZone = timeZone
    }
    let hour = calendar.component(.hour, from: date)
    var status:String
    if hour >= 5 && hour <= 10 {
        status = "Pagi"
    }else if hour >= 11 && hour <= 15{
        status = "Siang"
    }else if hour >= 16 && hour < 18{
        status = "Sore"
    }else if hour >= 18 && hour <= 19{
        status = "Petang"
    }else{
        status = "Malam"
    }
    return status
}


func convertIntToFormatMoney(money:Int,isDepoOrWithdraw:TypeHistory?) -> String{
    let formatter = NumberFormatter()
    formatter.locale = Locale(identifier: "id_ID")
    formatter.groupingSeparator = "."
    formatter.numberStyle = .decimal
    var result: String = "",symbol:String = ""
    
    if isDepoOrWithdraw != nil{
        symbol = isDepoOrWithdraw == .deposit  ? "+" : "-"
    }
    
    if let formattedTipAmount = formatter.string(from: money as NSNumber) {
       result = "\(symbol)Rp " + formattedTipAmount
    }
    return result
}

func convertIntToFormatMoneyRaw(money:Int) -> String{
    let formatter = NumberFormatter()
    formatter.locale = Locale(identifier: "id_ID")
    formatter.groupingSeparator = "."
    formatter.numberStyle = .decimal
    var result: String = ""
    if let formattedTipAmount = formatter.string(from: money as NSNumber) {
       result = formattedTipAmount
    }
    return result
}

func getCurrentDate() -> String {
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "dd-MM-yyyy - HH.mm"
    let result = formatter.string(from: date)
    return result
}
