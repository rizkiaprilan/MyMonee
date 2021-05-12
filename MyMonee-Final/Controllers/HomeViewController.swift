//
//  HomeViewController.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 12/05/21.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let homeTableViewCell = String(describing: HomeTableViewCell.self) // ambil nama xib
    
    @IBOutlet weak var historyView: UIView!
    @IBOutlet weak var historyTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        cell.imageStatus.image = UIImage(named: historyData[indexPath.row].extensions.image)
        cell.title.text = historyData[indexPath.row].title
        cell.dateAndTime.text = historyData[indexPath.row].date
        cell.price.text = historyData[indexPath.row].price
        cell.price.textColor = UIColor(named: historyData[indexPath.row].extensions.fontColor)
        
        return cell
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
