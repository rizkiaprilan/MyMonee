//
//  HomeTableViewCell.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 12/05/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    var dataHistoryRow:HistoryData?
    @IBOutlet weak var homeTableViewCell: UIView!
    @IBOutlet weak var imageStatus: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var dateAndTime: UILabel!
    
//    @IBAction func goHomeDetail(_ sender: UITapGestureRecognizer) {
//        let homeDetailViewController = HomeDetailViewController(nibName: String(describing: HomeDetailViewController.self), bundle: nil)
//        
//        homeDetailViewController.trasancationId.text = dataHistoryRow?.id
//        homeDetailViewController.typeImage = imageStatus
//        homeDetailViewController.dateTransaction.text = dateAndTime.text
//        homeDetailViewController.titleTransaction.text = title.text
//        homeDetailViewController.transactionPrice.text = price.text
//        homeDetailViewController.typeTransaction.text = dataHistoryRow?.extensions.status.rawValue
//        
//        homeDetailViewController.modalPresentationStyle = .fullScreen
//        homeDetailViewController.modalTransitionStyle = .flipHorizontal
//    }
    override func awakeFromNib() { //method yg ketrigger ketika tampilan dibuka
        super.awakeFromNib()
        
//        ex:
//        homeTableViewCell.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
