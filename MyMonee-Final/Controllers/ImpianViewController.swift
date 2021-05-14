//
//  ImpianViewController.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 12/05/21.
//

import UIKit

class ImpianViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    let impianTableViewCell = String(describing: ImpianTableViewCell.self)

    @IBOutlet weak var impianTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set table view cell
        impianTableView.delegate = self
        impianTableView.dataSource = self
        let uiNib = UINib(nibName: impianTableViewCell, bundle: nil)
        impianTableView.register(uiNib, forCellReuseIdentifier: impianTableViewCell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataImpianByUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable:next line_length
//        let cell = impianTableView.dequeueReusableCell(withIdentifier: impianTableViewCell, for: indexPath) as! ImpianTableViewCell
        
        let cell = impianTableView.dequeueReusableCell(withIdentifier: impianTableViewCell, for: indexPath) as! ImpianTableViewCell
        
        cell.titleImpian.text = dataImpianByUser[indexPath.row].title
        cell.progressBarImpian.setProgress(dataImpianByUser[indexPath.row].progress, animated: true)
        cell.totalImpian.text = dataImpianByUser[indexPath.row].amount
        
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
