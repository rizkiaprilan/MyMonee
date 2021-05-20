//
//  HomeTableViewCell.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 12/05/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var homeTableViewCell: UIView!
    @IBOutlet weak var imageStatus: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var dateAndTime: UILabel!
    
    override func awakeFromNib() { // method yg ketrigger ketika tampilan dibuka
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func showData(historyTransaction: HistoryDataAPI){
        imageStatus.image = UIImage(named: Extensions(statusHistory: TypeHistory(rawValue: historyTransaction.extensions)!).image)
        price.text = convertIntToFormatMoney(money: historyTransaction.price, isDepoOrWithdraw: TypeHistory(rawValue: historyTransaction.extensions))
        title.text = historyTransaction.title
        dateAndTime.text = getCurrentDate()
    }
    
}
