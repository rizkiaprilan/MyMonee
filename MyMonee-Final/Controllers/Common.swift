//
//  Common.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 12/05/21.
//

import Foundation
import UIKit

func getCurrentDayTime() -> String {
    let date = Date()
    var calendar = Calendar.current
    if let timeZone = TimeZone(identifier: "WIB") {
        calendar.timeZone = timeZone
    }
    let hour = calendar.component(.hour, from: date)
    if hour >= 5 && hour <= 10 {return "Pagi"}
    if hour >= 11 && hour <= 15 {return "Siang"}
    if hour >= 16 && hour < 18 {return "Sore"}
    if hour >= 18 && hour <= 19 {return "Petang"}
    return "Malam"
}

func convertIntToFormatMoney(money:Int,isDepoOrWithdraw:TypeHistory?) -> String {
    let formatter = NumberFormatter()
    formatter.locale = Locale(identifier: "id_ID")
    formatter.groupingSeparator = "."
    formatter.numberStyle = .decimal
    var result: String = "",symbol:String = ""
    
    if isDepoOrWithdraw != nil {
        symbol = isDepoOrWithdraw == .deposit  ? "+" : "-"
    }
    
    if let formattedTipAmount = formatter.string(from: money as NSNumber) {
       result = "\(symbol)Rp " + formattedTipAmount
    }
    return result
}

func convertIntToFormatMoneyRaw(money:Int) -> String {
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
    formatter.dateFormat = "dd MMMM yyyy - HH.mm"
    let result = formatter.string(from: date)
    return result
}

func alert() -> UIAlertController {
    let alert = UIAlertController(title: "Data Kurang Lengkap!", message: "Tolong masukkan data dengan lengkap", preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
    return alert
}

func goBackToMainTabBar() -> UIViewController {
    let viewController = MainTabBarController(nibName: String(describing: MainTabBarController.self), bundle: nil)
    viewController.modalPresentationStyle = .fullScreen
    viewController.modalTransitionStyle = .flipHorizontal
    return viewController
}
