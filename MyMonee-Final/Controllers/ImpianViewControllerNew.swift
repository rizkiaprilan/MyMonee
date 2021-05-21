//
//  ImpianViewControllerNew.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 15/05/21.
//

import UIKit

class ImpianViewControllerNew: UIViewController, UITableViewDelegate, UITableViewDataSource,DataKosong,Executable {
    func deleteImpian(_ indexSectionImpian: Int) {
        dataImpianByUser.remove(at: indexSectionImpian)
        dataTable.reloadData()
        self.viewWillAppear(true)
    }
    
    func confirmImpian(_ impian: ImpianByUser, _ indexSectionImpian: Int) {
        dataImpianByUser.remove(at: indexSectionImpian)
        NetworkService().createHistoryData(data: HistoryData(title: impian.title, extensions: Extensions(statusHistory: .withdraw), price: impian.amount.target))
        dataTable.reloadData()
        self.viewWillAppear(true)
    }
    
    func addPage() {
        let viewController = AddImpianViewController(nibName: String(describing: AddImpianViewController.self), bundle: nil)
        self.navigationController?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBOutlet var empty: EmptyDataHistory!
    @IBOutlet var dataTable: UITableView!
    @IBAction func addImpian(_ sender: UIButton) {
        let viewController = AddImpianViewController(nibName: String(describing: AddImpianViewController.self), bundle: nil)
        self.navigationController?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        dataImpianByUser.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataImpianByUser[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let persentase = Float(getBalance().withoutFormatMoney)/Float(dataImpianByUser[indexPath.section][indexPath.row].amount.target)
        let cell = dataTable.dequeueReusableCell(withIdentifier: String(describing: ImpianTableViewCell.self), for: indexPath) as! ImpianTableViewCell
        cell.title.text = dataImpianByUser[indexPath.section][indexPath.row].title
        cell.progress.progress = persentase
        cell.amount.text = "IDR \(convertIntToFormatMoneyRaw(money: getBalance().withoutFormatMoney)) / \(dataImpianByUser[indexPath.section][indexPath.row].amount.target)"
        
        cell.dataImpian = dataImpianByUser[indexPath.section][indexPath.row]
        cell.indexSection = indexPath.section
        cell.delegate = self
        
        if persentase < 1.0 {
            cell.confirm.setImage(UIImage(named: "disable_confirm"), for: .normal)
            cell.confirm.isEnabled = false
        } else {
            cell.confirm.setImage(UIImage(named: "confirm"), for: .normal)
            cell.confirm.isEnabled = true
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = ImpianDetailViewController(nibName: String(describing: ImpianDetailViewController.self), bundle: nil)
        viewController.indexSection = indexPath.section
        viewController.impianData = dataImpianByUser[indexPath.section]
        self.navigationController?.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dataTable.reloadData()
        empty.delegate = self
        if(dataImpianByUser.isEmpty) {
            empty.layer.cornerRadius = 16
            empty.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
            empty.isHidden = false
            empty.button.setTitle("Tambah Impian", for: .normal)
            dataTable.isHidden = true
        } else {
            dataTable.isHidden = true
            dataTable.isHidden = false
        }
        let uiNib = UINib(nibName: String(describing: ImpianTableViewCell.self), bundle: nil)
        dataTable.register(uiNib, forCellReuseIdentifier: String(describing: ImpianTableViewCell.self))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataTable.delegate = self
        dataTable.dataSource = self
    }
}
