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
        addHomeViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(addHomeViewController, animated: true)
    }
    
    let homeTableViewCell = String(describing: HomeTableViewCell.self) // ambil nama xib
    @IBOutlet var loading: UIActivityIndicatorView!
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
        addHomeViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(addHomeViewController, animated: true)
    }
    
    fileprivate func viewHistoryTransaction() {
        if(dataSource.isEmpty) {
            emptyData.layer.cornerRadius = 16
            emptyData.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
            emptyData.isHidden = false
            historyView.isHidden = true
        } else {
            emptyData.isHidden = true
            historyView.isHidden = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.loadData()
        greetingMessage.text = "Selamat \(getCurrentDayTime()),"
        self.userName.text = UserDefaults.standard.string(forKey: "username") ?? profileData.name
        emptyData.delegate = self
        historyTableView.reloadData()
    }
    
    func loadData() {
        NetworkService().loadHistoryData(completion: { (historyList) in
            DispatchQueue.main.async {
                self.loading.startAnimating()
                dataSource = historyList
                self.historyTableView.reloadData()
                self.viewHistoryTransaction()
                self.balance.text = getBalance().withFormatMoney
                let lastDataTransaction = getLastDepoAndWithdraw()
                self.lastWithdraw.text = lastDataTransaction.lastWithdraw
                self.lastDeposit.text = lastDataTransaction.lastDeposit
                self.loading.stopAnimating()
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyView.layer.cornerRadius = 24
        historyView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        
        historyTableView.delegate = self // untuk manage action
        historyTableView.dataSource = self
        let uiNib = UINib(nibName: homeTableViewCell, bundle: nil) // set UINib nya
        historyTableView.register(uiNib, forCellReuseIdentifier: homeTableViewCell) // masukkan UINib kedalam table view nya
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = historyTableView.dequeueReusableCell(withIdentifier: homeTableViewCell, for: indexPath) as! HomeTableViewCell
        cell.showData(historyTransaction: dataSource[indexPath.row])
        cell.price.textColor = UIColor(named: Extensions(statusHistory: TypeHistory(rawValue: dataSource[indexPath.row].extensions)!).fontColor)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let homeDetailViewController = HomeDetailViewController(nibName: String(describing: HomeDetailViewController.self), bundle: nil)
        homeDetailViewController.dataHistory = dataSource[indexPath.row]
        homeDetailViewController.indexData = indexPath.row
        
        homeDetailViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(homeDetailViewController, animated: true)
    }
}

extension UIViewController{
//    func showToast(message : String, font: UIFont) {
//        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height/2, width: 150, height: 35))
//        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
//        toastLabel.textColor = UIColor.white
//        toastLabel.font = font
//        toastLabel.textAlignment = .center;
//        toastLabel.text = message
//        toastLabel.alpha = 1.0
//        toastLabel.layer.cornerRadius = 10;
//        toastLabel.clipsToBounds  =  true
//        self.view.addSubview(toastLabel)
//        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
//            toastLabel.alpha = 0.0
//        }, completion: {(isCompleted) in
//            toastLabel.removeFromSuperview()
//        })
//    }
    
//    static let DELAY_SHORT = 1.5
//    static let DELAY_LONG = 3.0
//    
    func showToast(_ text: String, delay: Float) {
            guard let window = UIApplication.shared.keyWindow else {
                return
            }
            let label = UILabel()
            label.backgroundColor = UIColor(white: 0, alpha: 0.5)
            label.textColor = .white
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 15)
            label.alpha = 0
            label.text = text
            label.numberOfLines = 0
            
            var vertical: CGFloat = 0
            var size = label.intrinsicContentSize
            var width = min(size.width, window.frame.width - 30)
            if width != size.width {
                vertical = 10
                label.textAlignment = .justified
            }
            
            size = label.intrinsicContentSize
            width = min(size.width, window.frame.width - 100)
            
            label.frame = CGRect(x: 20, y: window.frame.height - 90, width: width + 20, height: size.height + 20)
            label.center.x = window.center.x
            //label.layer.cornerRadius = min(label.frame.height/2, 25)
            label.layer.masksToBounds = true
            window.addSubview(label)
            
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
                label.alpha = 1
            }, completion: { _ in
                UIView.animate(withDuration: 0.5, delay: TimeInterval(delay), options: .curveEaseOut, animations: {
                    label.alpha = 0
                }, completion: {_ in
                    label.removeFromSuperview()
                })
            })
        }
}
