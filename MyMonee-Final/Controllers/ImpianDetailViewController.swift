//
//  ImpianDetailViewController.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 14/05/21.
//

import UIKit

class ImpianDetailViewController: UIViewController {
    
    var impianData: [ImpianByUser] = Array()
    @IBOutlet var titleImpian: UILabel!
    @IBOutlet var priceImpian: UILabel!
    @IBOutlet var persantase: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var amountImpian: UILabel!
    @IBOutlet weak var confirmationButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBAction func backTapped(_ sender: UIButton) {
        let viewController = MainTabBarController(nibName: String(describing: MainTabBarController.self), bundle: nil)
        
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .flipHorizontal
        self.present(viewController, animated: true, completion: nil)
    }
    @IBAction func confirmationTapped(_ sender: UIButton) {
        let viewController = MainTabBarController(nibName: String(describing: MainTabBarController.self), bundle: nil)
        
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .flipHorizontal
        self.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func edit(_ sender: UIButton) {
        let viewController = UpdateImpianViewController(nibName: String(describing: UpdateImpianViewController.self), bundle: nil)
        
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .flipHorizontal
        self.present(viewController, animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        backButton.layer.borderWidth = 3
        backButton.layer.cornerRadius = 20
        backButton.layer.borderColor = UIColor(red: 0.314, green: 0.412, blue: 0.722, alpha: 1).cgColor
        
        confirmationButton.layer.backgroundColor = UIColor(red: 0.314, green: 0.412, blue: 0.722, alpha: 1).cgColor
        
        confirmationButton.layer.cornerRadius = 20
        
        titleImpian.text = impianData[0].title
        priceImpian.text = convertIntToFormatMoney(money: impianData[0].amount.target, isDepoOrWithdraw: nil)
        persantase.text = "\((Float(impianData[0].amount.current)/Float(impianData[0].amount.target)) * 100)%"
        progressBar.progress = Float(impianData[0].amount.current)/Float(impianData[0].amount.target)
        amountImpian.text = impianData[0].amountString
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmationButton.frame = CGRect(x: 0, y: 0, width: 338, height: 43)
        if (Float(impianData[0].amount.current)/Float(impianData[0].amount.target)) * 100 != 100 {
            confirmationButton.isEnabled = false
        }else{
            confirmationButton.isEnabled = true
        }
        
        // Do any additional setup after loading the view.
    }
    
}
