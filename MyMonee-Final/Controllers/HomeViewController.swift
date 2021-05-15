//
//  HomeViewController.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 12/05/21.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let homeTableViewCell = String(describing: HomeTableViewCell.self) // ambil nama xib
    
    @IBOutlet weak var lastWithdraw: UILabel!
    @IBOutlet weak var lastDeposit: UILabel!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var historyView: UIView!
    @IBOutlet weak var historyTableView: UITableView!
    @IBOutlet weak var greetingMessage: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBAction func addPenggunaan(_ sender: UITapGestureRecognizer) {
        let addHomeViewController = AddHomeViewController(nibName: String(describing: AddHomeViewController.self), bundle: nil)
        
        addHomeViewController.modalPresentationStyle = .fullScreen
        addHomeViewController.modalTransitionStyle = .flipHorizontal
        self.present(addHomeViewController, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.userName.text = profileData.name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greetingMessage.text = "Selamat \(getCurrentDayTime()),"
        
        balance.text = getBalance()
        
        let lastDataTransaction = getLastDepoAndWithdraw()
        lastWithdraw.text = lastDataTransaction.lastWithdraw
        lastDeposit.text = lastDataTransaction.lastDeposit
        
        historyView.layer.cornerRadius = 24
        
        historyTableView.delegate = self // untuk manage action
        historyTableView.dataSource = self
        let uiNib = UINib(nibName: homeTableViewCell, bundle: nil) // set UINib nya
        // swiftlint:disable:next line_length
        historyTableView.register(uiNib, forCellReuseIdentifier: homeTableViewCell) // masukkan UINib kedalam table view nya
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable:next line_length
        let cell = historyTableView.dequeueReusableCell(withIdentifier: homeTableViewCell, for: indexPath) as! HomeTableViewCell
        
        cell.dataHistoryRow = historyData[indexPath.row]
        cell.imageStatus.image = UIImage(named: historyData[indexPath.row].extensions.image)
        cell.title.text = historyData[indexPath.row].title
        cell.dateAndTime.text = historyData[indexPath.row].date
        cell.price.text = convertIntToFormatMoney(money: historyData[indexPath.row].price, isDepoOrWithdraw: historyData[indexPath.row].extensions.status)
        cell.price.textColor = UIColor(named: historyData[indexPath.row].extensions.fontColor)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let homeDetailViewController = HomeDetailViewController(nibName: String(describing: HomeDetailViewController.self), bundle: nil)
        
//        switch historyData[indexPath.row].extensions.status {
//        case .deposit:
//            homeDetailViewController.typeImage.image = UIImage(named: historyData[indexPath.row].extensions.image)
//        case .withdraw:
//            homeDetailViewController.typeImage.image = UIImage(named: historyData[indexPath.row].extensions.image)
//        }
        print(historyData[indexPath.row])
//        print(homeDetailViewController.dateTransaction.text!)
//        home DetailViewController.dateTransaction.text = historyData[indexPath.row].date
        homeDetailViewController.dataHistory = historyData[indexPath.row]
        
        homeDetailViewController.modalPresentationStyle = .fullScreen
        homeDetailViewController.modalTransitionStyle = .flipHorizontal
        self.present(homeDetailViewController, animated: true, completion: nil)
    }
}
