//
//  HomeDetailViewController.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 14/05/21.
//

import UIKit

class HomeDetailViewController: UIViewController {

    var dataHistory:HistoryData?
    var indexData:Int?
    
    @IBAction func edit(_ sender: Any) {
        let viewController = UpdateHomeViewController(nibName: String(describing: UpdateHomeViewController.self), bundle: nil)
        
        viewController.indexData = indexData
        viewController.lastData = dataHistory
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .flipHorizontal
        self.present(viewController, animated: true, completion: nil)
    }
    @IBAction func back(_ sender: UIButton) {
        let viewController = MainTabBarController(nibName: String(describing: MainTabBarController.self), bundle: nil)

        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .flipHorizontal
        self.present(viewController, animated: true, completion: nil)
    }
    @IBOutlet var typeImage: UIImageView!
    @IBOutlet var titleTransaction: UILabel!
    @IBOutlet var typeTransaction: UILabel!
    @IBOutlet var transactionPrice: UILabel!
    @IBOutlet var trasancationId: UILabel!
    @IBOutlet var dateTransaction: UILabel!
    
    @IBOutlet var button: UIButton!
    override func viewWillAppear(_ animated: Bool) {
        button.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor(red: 0.314, green: 0.412, blue: 0.722, alpha: 1).cgColor
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateTransaction.text = dataHistory?.date
        typeImage.image = UIImage(named: (dataHistory?.extensions.image)!)
        switch dataHistory!.extensions.status{
        
        case .deposit:
            typeTransaction.text = "Pemasukan"
        case .withdraw:
            typeTransaction.text = "Pengeluaran"
        }
        titleTransaction.text = dataHistory?.title
        transactionPrice.text = convertIntToFormatMoney(money: dataHistory!.price, isDepoOrWithdraw: dataHistory!.extensions.status)
        transactionPrice.textColor = UIColor(named: dataHistory!.extensions.fontColor)
        trasancationId.text = dataHistory?.id
        
    }
}
