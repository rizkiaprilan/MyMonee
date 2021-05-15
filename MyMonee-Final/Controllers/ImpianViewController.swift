//
//  ImpianViewController.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 15/05/21.
//

import UIKit

class ImpianViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    let impianCell = String(describing: ImpianTableViewCell.self)
    
    @IBOutlet var viewImpian: UIView!
    @IBOutlet weak var impianTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        impianTable.delegate = self
        impianTable.dataSource = self
        let uiNib = UINib(nibName: impianCell, bundle: nil)
        impianTable.register(uiNib, forCellReuseIdentifier: impianCell)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = impianTable.dequeueReusableCell(withIdentifier: impianCell, for: indexPath) as! ImpianTableViewCell
        cell.title.text = dataImpianByUser[indexPath.row].title
        cell.progress.progress = dataImpianByUser[indexPath.row].progress
        cell.amount.text = dataImpianByUser[indexPath.row].amount
        return cell
    }
}
