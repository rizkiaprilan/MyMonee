//
//  ImpianViewControllerNew.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 15/05/21.
//

import UIKit

class ImpianViewControllerNew: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var dataTable: UITableView!
    @IBAction func addImpian(_ sender: UIButton) {
        let viewController = AddImpianViewController(nibName: String(describing: AddImpianViewController.self), bundle: nil)
        
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .flipHorizontal
        self.present(viewController, animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        dataImpianByUser.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataImpianByUser[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dataTable.dequeueReusableCell(withIdentifier: String(describing: ImpianTableViewCell.self), for: indexPath) as! ImpianTableViewCell
        cell.title.text = dataImpianByUser[indexPath.section][indexPath.row].title
        cell.progress.progress = dataImpianByUser[indexPath.section][indexPath.row].progress
        cell.amount.text = dataImpianByUser[indexPath.section][indexPath.row].amountString
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = ImpianDetailViewController(nibName: String(describing: ImpianDetailViewController.self), bundle: nil)
        viewController.indexSection = indexPath.section
        viewController.impianData = dataImpianByUser[indexPath.section]
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .flipHorizontal
        self.present(viewController, animated: true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataTable.delegate = self
        dataTable.dataSource = self
        let uiNib = UINib(nibName: String(describing: ImpianTableViewCell.self), bundle: nil)
        dataTable.register(uiNib, forCellReuseIdentifier: String(describing: ImpianTableViewCell.self))
    }
}
