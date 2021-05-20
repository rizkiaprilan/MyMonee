//
//  ImpianTableViewCell.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 15/05/21.
//

import UIKit

protocol Executable {
    func deleteImpian(_ indexSectionImpian:Int)
    func confirmImpian(_ impian: ImpianByUser,_ indexSectionImpian:Int)
}

class ImpianTableViewCell: UITableViewCell {
    
    var delegate:Executable?
    var dataImpian: ImpianByUser?
    var indexSection: Int?
    var viewController: ImpianViewControllerNew?
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet var delete: UIButton!
    @IBOutlet var confirm: UIButton!
    
    @IBAction func deleteAction(_ sender: UIButton) {
        self.delegate?.deleteImpian(indexSection!)
        
    }
    @IBAction func confirmAction(_ sender: UIButton) {
        self.delegate?.confirmImpian(dataImpian!, indexSection!)
    
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
