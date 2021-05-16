//
//  UpdateHomeViewController.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 15/05/21.
//

import UIKit


class UpdateHomeViewController: UIViewController {
    
    var lastData:HistoryData?
    var indexData:Int?
    var statusPemasukan:Bool = false
    var statusPenarikan:Bool = false
    @IBOutlet var judulField: UITextField!
    @IBOutlet var jumlahField: UITextField!
    @IBOutlet var pemasukanView: UIView!
    @IBOutlet var penarikanView: UIView!
    @IBOutlet var hapusButton: UIButton!
    
    @IBAction func back(_ sender: Any) {
        let homeDetailViewController = HomeDetailViewController(nibName: String(describing: HomeDetailViewController.self), bundle: nil)
        homeDetailViewController.dataHistory = lastData
        homeDetailViewController.modalPresentationStyle = .fullScreen
        homeDetailViewController.modalTransitionStyle = .flipHorizontal
        self.present(homeDetailViewController, animated: true, completion: nil)
    }
    @IBAction func simpan(_ sender: Any) {
        
        if judulField.text!.isEmpty || jumlahField.text!.isEmpty || (statusPemasukan == false && statusPenarikan == false)  {
            alert()
            return
        }
        
        if statusPemasukan{
            updateData(type: .deposit)
        }
        if statusPenarikan{
            updateData(type: .withdraw)
        }
        goBackToMainTabBar()
    }
    
    @IBAction func hapus(_ sender: Any) {
        historyData.remove(at: indexData!)
        goBackToMainTabBar()
    }
    
    @IBAction func pemasukkanTapped(_ sender: Any) {
        if statusPemasukan == false{
            pemasukanView.layer.borderWidth = 3
            pemasukanView.layer.borderColor = UIColor(red: 0.314, green: 0.412, blue: 0.722, alpha: 1).cgColor
            statusPemasukan = true
            penarikanView.layer.borderWidth = 0
        }else{
            pemasukanView.layer.borderWidth = 0
            statusPemasukan = true
        }
        statusPenarikan = false
    }
    @IBAction func penarikanTapped(_ sender: Any) {
        if statusPenarikan == false{
            penarikanView.layer.borderWidth = 3
            penarikanView.layer.borderColor = UIColor(red: 0.314, green: 0.412, blue: 0.722, alpha: 1).cgColor
            statusPenarikan = true
            pemasukanView.layer.borderWidth = 0
        }else{
            penarikanView.layer.borderWidth = 0
            statusPenarikan = false
        }
        statusPemasukan = false
    }
    
    fileprivate func goBackToMainTabBar() {
        let viewController = MainTabBarController(nibName: String(describing: MainTabBarController.self), bundle: nil)
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .flipHorizontal
        self.present(viewController, animated: true, completion: nil)
    }
    
    private func alert() {
        let alert = UIAlertController(title: "Bad Request", message: "Tolong masukkan data dengan lengkap", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    fileprivate func updateData(type: TypeHistory) {
        historyData[indexData!] = HistoryData(title: judulField.text!, date: getCurrentDate(), extensions: Extensions(statusHistory: type), price: Int(jumlahField.text!)!)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        judulField.text = lastData?.title
        jumlahField.text = String(lastData!.price)
        hapusButton.layer.borderWidth = 3
        hapusButton.layer.borderColor = UIColor(red: 0.922, green: 0.341, blue: 0.341, alpha: 1).cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}



