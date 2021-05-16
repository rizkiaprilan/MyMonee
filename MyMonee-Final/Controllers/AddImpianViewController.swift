//
//  AddImpianViewController.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 14/05/21.
//

import UIKit

class AddImpianViewController: UIViewController {

    @IBOutlet var titleImpian: UITextField!
    @IBOutlet var targetImpian: UITextField!
    
    @IBAction func simpanTapped(_ sender: UIButton) {
        if titleImpian.text!.isEmpty || targetImpian.text!.isEmpty {
            makeAlert()
            return
        }
        insertData()
        makeBackToMainTabBar()
        
    }
    
    @IBAction func back(_ sender: Any) {
        makeBackToMainTabBar()
    }
    
    fileprivate func insertData() {
        dataImpianByUser.append([ImpianByUser(title: titleImpian.text!, amount: Amount(current: 0, target: Int(targetImpian.text!)!))])
    }
    
    fileprivate func makeBackToMainTabBar() {
        self.present(goBackToMainTabBar(), animated: true, completion: nil)
    }
    
    fileprivate func makeAlert() {
        self.present(alert(), animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
