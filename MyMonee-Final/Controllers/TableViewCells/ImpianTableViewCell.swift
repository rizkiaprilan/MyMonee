//
//  ImpianTableViewCell.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 15/05/21.
//

import UIKit

protocol Executable {
    func deleteImpian(indexSectionImpian:Int)
    func confirmImpian(impian: ImpianByUser,indexSectionImpian:Int)
}

class ImpianTableViewCell: UITableViewCell,Executable {
    
    func deleteImpian(indexSectionImpian: Int) {
        dataImpianByUser.remove(at: indexSection!)
    }
    
    func confirmImpian(impian: ImpianByUser, indexSectionImpian: Int) {
        historyData.append(HistoryData(title: dataImpian!.title, extensions: Extensions(statusHistory: .withdraw), price: dataImpian!.amount.target))
        dataImpianByUser.remove(at: indexSection!)
    }
    
    var dataImpian: ImpianByUser?
    var indexSection: Int?
    var viewController: ImpianViewControllerNew?
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet var delete: UIButton!
    @IBOutlet var confirm: UIButton!
    
    @IBAction func deleteAction(_ sender: UIButton) {
        deleteImpian(indexSectionImpian: indexSection!)
        viewController?.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func confirmAction(_ sender: UIButton) {
        confirmImpian(impian: dataImpian!, indexSectionImpian: indexSection!)
        viewController?.navigationController?.popToRootViewController(animated: true)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
