//
//  EmptyDataHistory.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 18/05/21.
//

import UIKit

protocol DataKosong {
    func addPage()
}

class EmptyDataHistory: UIView {

    @IBOutlet var button: UIButton!
    var delegate:DataKosong?
    @IBOutlet var view: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    @IBAction func button(_ sender: Any) {
        self.delegate?.addPage() 
    }
    // constructor kepanggil saat membuat view secara storyboard
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        
        Bundle.main.loadNibNamed("EmptyDataHistory", owner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
    }
    
}
