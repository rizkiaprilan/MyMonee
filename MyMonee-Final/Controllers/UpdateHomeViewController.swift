//
//  UpdateHomeViewController.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 15/05/21.
//

import UIKit

class UpdateHomeViewController: UIViewController {
    
    var lastData:HistoryDataAPI?
    var indexData:Int?
    var indexSection:Int?
    var statusPemasukan:Bool = false
    var statusPenarikan:Bool = false
    @IBOutlet var judulField: UITextField!
    @IBOutlet var jumlahField: UITextField!
    @IBOutlet var pemasukanView: UIView!
    @IBOutlet var penarikanView: UIView!
    @IBOutlet var hapusButton: UIButton!
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func simpan(_ sender: Any) {
        if judulField.text!.isEmpty || jumlahField.text!.isEmpty || (statusPemasukan == false && statusPenarikan == false) {
            makeAlert()
            return
        }
        if statusPemasukan {
            updateData(type: .deposit)
        }
        if statusPenarikan {
            updateData(type: .withdraw)
        }
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func hapus(_ sender: Any) {
//        historyData.remove(at: indexData!)
        let service: NetworkService = NetworkService()
        service.deleteHistoryData(id: lastData!.id)
        
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func pemasukkanTapped(_ sender: Any) {
        if statusPemasukan == false {
            pemasukanView.layer.borderWidth = 3
            pemasukanView.layer.borderColor = UIColor(red: 0.314, green: 0.412, blue: 0.722, alpha: 1).cgColor
            statusPemasukan = true
            penarikanView.layer.borderWidth = 0
        } else {
            pemasukanView.layer.borderWidth = 0
            statusPemasukan = false
        }
        statusPenarikan = false
    }
    
    @IBAction func penarikanTapped(_ sender: Any) {
        if statusPenarikan == false {
            penarikanView.layer.borderWidth = 3
            penarikanView.layer.borderColor = UIColor(red: 0.314, green: 0.412, blue: 0.722, alpha: 1).cgColor
            statusPenarikan = true
            pemasukanView.layer.borderWidth = 0
        } else {
            penarikanView.layer.borderWidth = 0
            statusPenarikan = false
        }
        statusPemasukan = false
    }
    
    fileprivate func makeViewShadow(view: UIView) {
        view.clipsToBounds = false
        let shadowPath0 = UIBezierPath(roundedRect: view.bounds, cornerRadius: 8)
        view.layer.shadowPath = shadowPath0.cgPath
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.bounds = view.bounds
        view.layer.position = view.center
    }
    
    fileprivate func makeAlert() {
        self.present(alert(), animated: true, completion: nil)
    }
    
    fileprivate func updateData(type: TypeHistory) {
        let data = HistoryData(title: judulField.text!, extensions: Extensions(statusHistory: type), price: Int(jumlahField.text!)!)
        
        let service: NetworkService =  NetworkService()
        service.updateHistoryData(data: data,id: lastData!.id)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        judulField.text = lastData?.title
        jumlahField.text = String(lastData!.price)
        hapusButton.layer.borderWidth = 3
        hapusButton.layer.borderColor = UIColor(red: 0.922, green: 0.341, blue: 0.341, alpha: 1).cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeViewShadow(view: penarikanView)
        makeViewShadow(view: pemasukanView)
    }
}
