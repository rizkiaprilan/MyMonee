//
//  ImpianTableViewCell.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 15/05/21.
//

import UIKit

class ImpianTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var amount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
