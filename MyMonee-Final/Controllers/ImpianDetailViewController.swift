//
//  ImpianDetailViewController.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 14/05/21.
//

import UIKit

class ImpianDetailViewController: UIViewController {
    
    var impianData: [ImpianByUser] = Array()
    var indexSection:Int?
    var persentage:Float = Float()
    @IBOutlet var titleImpian: UILabel!
    @IBOutlet var priceImpian: UILabel!
    @IBOutlet var persantase: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var amountImpian: UILabel!
    @IBOutlet weak var confirmationButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet var detailVIew: UIView!
    @IBAction func backTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func confirmationTapped(_ sender: UIButton) {
        historyData.append(HistoryData(title: impianData[0].title, extensions: Extensions(statusHistory: .withdraw), price: impianData[0].amount.target))
        dataImpianByUser.remove(at: indexSection!)
        
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func edit(_ sender: UIButton) {
        let viewController = UpdateImpianViewController(nibName: String(describing: UpdateImpianViewController.self), bundle: nil)
        viewController.impianData = impianData
        viewController.indexSection = indexSection
        viewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        backButton.layer.borderWidth = 3
        backButton.layer.cornerRadius = 20
        backButton.layer.borderColor = UIColor(red: 0.314, green: 0.412, blue: 0.722, alpha: 1).cgColor

        confirmationButton.layer.backgroundColor = UIColor(red: 0.314, green: 0.412, blue: 0.722, alpha: 1).cgColor
        confirmationButton.layer.cornerRadius = 20

        titleImpian.text = impianData[0].title
        priceImpian.text = convertIntToFormatMoney(money: impianData[0].amount.target, isDepoOrWithdraw: nil)
        self.persentage = Float(getBalance().withoutFormatMoney)/Float(impianData[0].amount.target) * 100
        persantase.text = self.persentage > 100 ? "100%" :"\(round(self.persentage * 100) / 100.0)%"
        progressBar.progress = self.persentage/100
        amountImpian.text = "IDR \(convertIntToFormatMoneyRaw(money: getBalance().withoutFormatMoney)) / \(impianData[0].amount.target)"
        if persentage < 100 {
            confirmationButton.isEnabled = false
            return
        }
        confirmationButton.isEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeViewShadow(view: detailVIew)
        confirmationButton.frame = CGRect(x: 0, y: 0, width: 338, height: 43)
    }
}
