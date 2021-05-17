//
//  EmptyImpian.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 17/05/21.
//

import UIKit

class EmptyImpian: UIView {

    @IBOutlet var emptyImpian: EmptyImpian!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    // constructor kepanggil saat membuat view secara storyboard
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("EmptyImpian", owner: self, options: nil)
        addSubview(emptyImpian)
        emptyImpian.frame = self.bounds
        emptyImpian.autoresizingMask = [.flexibleWidth,.flexibleHeight]
    }
}
