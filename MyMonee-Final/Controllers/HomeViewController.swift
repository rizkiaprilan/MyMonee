//
//  HomeViewController.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 12/05/21.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,DataKosong {
    func addPage() {
        let addHomeViewController = AddHomeViewController(nibName: String(describing: AddHomeViewController.self), bundle: nil)
        
//        addHomeViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(addHomeViewController, animated: true)
    }
    
    let homeTableViewCell = String(describing: HomeTableViewCell.self) // ambil nama xib
    
    
    var dataSource: [HistoryDataAPI] = []
    @IBOutlet weak var lastWithdraw: UILabel!
    @IBOutlet weak var lastDeposit: UILabel!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var historyView: UIView!
    @IBOutlet weak var historyTableView: UITableView!
    @IBOutlet weak var greetingMessage: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet var emptyData: EmptyDataHistory!
    
    @IBAction func addPenggunaan(_ sender: UITapGestureRecognizer) {
        let addHomeViewController = AddHomeViewController(nibName: String(describing: AddHomeViewController.self), bundle: nil)
//        addHomeViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(addHomeViewController, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        greetingMessage.text = "Selamat \(getCurrentDayTime()),"
        self.userName.text = UserDefaults.standard.string(forKey: "username") ?? profileData.name
        historyTableView.reloadData()
        self.loadData()
        emptyData.delegate = self
        if(dataSource.isEmpty) {
            emptyData.layer.cornerRadius = 16
            emptyData.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
            emptyData.isHidden = false
            historyView.isHidden = true
        } else {
            emptyData.isHidden = true
            historyView.isHidden = false
        }
        balance.text = getBalance().withFormatMoney
        
        let lastDataTransaction = getLastDepoAndWithdraw()
        lastWithdraw.text = lastDataTransaction.lastWithdraw
        lastDeposit.text = lastDataTransaction.lastDeposit
                print(self.dataSource)
    }
    
    func loadData() {
        let service: NetworkService = NetworkService()
        service.loadHistoryData(completion: { (historyList) in
            DispatchQueue.main.async {
                self.dataSource = historyList
                self.historyTableView.reloadData()
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadData()
        
        historyView.layer.cornerRadius = 24
        historyView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        
        historyTableView.delegate = self // untuk manage action
        historyTableView.dataSource = self
        let uiNib = UINib(nibName: homeTableViewCell, bundle: nil) // set UINib nya
        // swiftlint:disable:next line_length
        historyTableView.register(uiNib, forCellReuseIdentifier: homeTableViewCell) // masukkan UINib kedalam table view nya
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable:next line_length
        let cell = historyTableView.dequeueReusableCell(withIdentifier: homeTableViewCell, for: indexPath) as! HomeTableViewCell
        print(dataSource[indexPath.row])
        cell.showData(historyTransaction: dataSource[indexPath.row])
        
        cell.price.textColor = UIColor(named: Extensions(statusHistory: TypeHistory(rawValue: dataSource[indexPath.row].extensions)!).fontColor)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let homeDetailViewController = HomeDetailViewController(nibName: String(describing: HomeDetailViewController.self), bundle: nil)
        
        homeDetailViewController.dataHistory = dataSource[indexPath.row]
        homeDetailViewController.indexData = indexPath.row

        self.navigationController?.pushViewController(homeDetailViewController, animated: true)
    }
}
