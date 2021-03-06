//
//  AddHomeViewController.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 14/05/21.
//

import UIKit

class AddHomeViewController: UIViewController {
    
    var statusPemasukan:Bool = false
    var statusPenarikan:Bool = false
    @IBOutlet var fieldJudul: UITextField!
    @IBOutlet var fieldJumlah: UITextField!
    @IBOutlet var simpan: UIButton!
    @IBOutlet var penarikan: UIView!
    @IBOutlet var pemasukan: UIView!
    @IBOutlet var loading: UIActivityIndicatorView!
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func masuk(_ sender: Any) {
        if statusPemasukan == false {
            pemasukan.layer.borderWidth = 3
            pemasukan.layer.borderColor = UIColor(red: 0.314, green: 0.412, blue: 0.722, alpha: 1).cgColor
            statusPemasukan = true
            penarikan.layer.borderWidth = 0
            simpan.layer.backgroundColor = UIColor(red: 0.314, green: 0.412, blue: 0.722, alpha: 1).cgColor
            simpan.isEnabled = true
            statusPenarikan = false
            return
        }
        pemasukan.layer.borderWidth = 0
        simpan.layer.backgroundColor = UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1).cgColor
        statusPemasukan = false
        simpan.isEnabled = false
        statusPenarikan = false
    }
    @IBAction func keluar(_ sender: Any) {
        if statusPenarikan == false {
            penarikan.layer.borderWidth = 3
            penarikan.layer.borderColor = UIColor(red: 0.314, green: 0.412, blue: 0.722, alpha: 1).cgColor
            statusPenarikan = true
            pemasukan.layer.borderWidth = 0
            simpan.layer.backgroundColor = UIColor(red: 0.314, green: 0.412, blue: 0.722, alpha: 1).cgColor
            simpan.isEnabled = true
            statusPemasukan = false
            return
        }
        penarikan.layer.borderWidth = 0
        simpan.layer.backgroundColor = UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1).cgColor
        statusPenarikan = false
        simpan.isEnabled = false
        statusPemasukan = false
    }
    @IBAction func simpanTapped(_ sender: UIButton) {
        if fieldJudul.text!.isEmpty || fieldJumlah.text!.isEmpty || (statusPemasukan == false && statusPenarikan == false) {
            makeAlert()
            return
        }
        insertDataHistory(type: statusPemasukan ? .deposit : .withdraw)
    }
    
    fileprivate func makeAlert() {
        self.present(alert(), animated: true, completion: nil)
    }

    fileprivate func insertDataHistory(type: TypeHistory) {
        self.loading.isHidden = false
        self.loading.startAnimating()
        let data: HistoryData = HistoryData(title: fieldJudul.text!, extensions: Extensions(statusHistory: type), price: Int(fieldJumlah.text!)!)
        
        NetworkService().createHistoryData(data: data) { (errorMessage) in
            DispatchQueue.main.async {
                self.showToast(errorMessage, delay: 1.5)
                self.loading.stopAnimating()
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        makeViewShadow(view: penarikan)
        makeViewShadow(view: pemasukan)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        simpan.isEnabled = false
        self.loading.isHidden = true
    }
}
