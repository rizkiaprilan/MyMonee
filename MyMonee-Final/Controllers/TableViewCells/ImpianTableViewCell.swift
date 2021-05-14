//
//  ImpianTableViewCell.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 13/05/21.
//

import UIKit

class ImpianTableViewCell: UITableViewCell {

    @IBOutlet var impianViewTableCell: UIView!
    @IBOutlet var titleImpian: UILabel!
    @IBOutlet var progressBarImpian: UIProgressView!
    @IBOutlet var totalImpian: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
