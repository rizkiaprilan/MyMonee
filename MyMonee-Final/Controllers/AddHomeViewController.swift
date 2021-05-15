//
//  AddHomeViewController.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 14/05/21.
//

import UIKit

class AddHomeViewController: UIViewController {
    

    
    @IBOutlet var fieldJudul: UITextField!
    @IBOutlet var fieldJumlah: UITextField!
    var statusPemasukan:Bool = false
    var statusPenarikan:Bool = false
    @IBOutlet var simpan: UIButton!
    
    fileprivate func goBackToMainTabBar() {
        let viewController = MainTabBarController(nibName: String(describing: MainTabBarController.self), bundle: nil)
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .flipHorizontal
        self.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func back(_ sender: Any) {
        goBackToMainTabBar()
    }
    
    private func alert() {
        let alert = UIAlertController(title: "Bad Request", message: "Tolong masukkan data dengan lengkap", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    fileprivate func insertDataHistory(type: TypeHistory) {
        historyData.append(HistoryData(title: fieldJudul.text!, date: getCurrentDate(), extensions: Extensions(statusHistory: type), price: Int(fieldJumlah.text!)!))
    }
    
    @IBAction func simpanTapped(_ sender: UIButton) {
        if fieldJudul.text!.isEmpty || fieldJumlah.text!.isEmpty || (statusPemasukan == false && statusPenarikan == false)   {
            alert()
            return
        }
        
        if statusPemasukan{
            insertDataHistory(type: .deposit)
        }
        if statusPenarikan{
            insertDataHistory(type: .withdraw)
        }
        goBackToMainTabBar()
    }
    @IBAction func pemasukanTapped(_ sender: UITapGestureRecognizer) {
        if statusPemasukan == false{
            pemasukan.layer.borderWidth = 3
            pemasukan.layer.borderColor = UIColor(red: 0.314, green: 0.412, blue: 0.722, alpha: 1).cgColor
            statusPemasukan = true
            penarikan.layer.borderWidth = 0
            simpan.layer.backgroundColor = UIColor(red: 0.314, green: 0.412, blue: 0.722, alpha: 1).cgColor
            simpan.isEnabled = true
        }else{
            pemasukan.layer.borderWidth = 0
            simpan.layer.backgroundColor = UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1).cgColor
            statusPemasukan = true
            simpan.isEnabled = false
        }
        statusPenarikan = false
    }
    @IBAction func penarikanTapped(_ sender: UITapGestureRecognizer) {
        if statusPenarikan == false{
            penarikan.layer.borderWidth = 3
            penarikan.layer.borderColor = UIColor(red: 0.314, green: 0.412, blue: 0.722, alpha: 1).cgColor
            statusPenarikan = true
            pemasukan.layer.borderWidth = 0
            simpan.layer.backgroundColor = UIColor(red: 0.314, green: 0.412, blue: 0.722, alpha: 1).cgColor
            simpan.isEnabled = true
        }else{
            penarikan.layer.borderWidth = 0
            simpan.layer.backgroundColor = UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1).cgColor
            statusPenarikan = false
            simpan.isEnabled = false
        }
        
        statusPemasukan = false
    }
    @IBOutlet var penarikan: UIView!
    @IBOutlet var pemasukan: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        simpan.isEnabled = false
        
    }
}
