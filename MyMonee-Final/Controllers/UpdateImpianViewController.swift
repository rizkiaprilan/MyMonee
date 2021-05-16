//
//  UpdateImpianViewController.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 16/05/21.
//

import UIKit

class UpdateImpianViewController: UIViewController {
    
    var impianData: [ImpianByUser] = Array()
    var indexSection:Int?
    @IBOutlet var judulField: UITextField!
    @IBOutlet var targetImpian: UITextField!
    @IBOutlet var deleteButton: UIButton!
    
    @IBAction func back(_ sender: Any) {
        let viewController = ImpianDetailViewController(nibName: String(describing: ImpianDetailViewController.self), bundle: nil)
        viewController.indexSection = indexSection
        viewController.impianData = impianData
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .flipHorizontal
        self.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func perbaruiTapped(_ sender: Any) {
        if judulField.text!.isEmpty || targetImpian.text!.isEmpty {
            makeAlert()
            return
        }
        updateData()
        makeBackToMainTabBar()
    }
    @IBAction func hapusTapped(_ sender: Any) {
        dataImpianByUser.remove(at: indexSection!)
        makeBackToMainTabBar()
    }
    
    fileprivate func makeBackToMainTabBar() {
        self.present(goBackToMainTabBar(), animated: true, completion: nil)
    }
    
    fileprivate func updateData() {
        dataImpianByUser[indexSection!] = [ImpianByUser(title: judulField.text!, amount: Amount(current: impianData[0].amount.current, target: Int(targetImpian.text!)!))]
    }
    
    private func makeAlert() {
        self.present(alert(), animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        deleteButton.layer.borderWidth = 3
        deleteButton.layer.borderColor = UIColor(red: 0.922, green: 0.341, blue: 0.341, alpha: 1).cgColor
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        judulField.text = impianData[0].title
        targetImpian.text = String(impianData[0].amount.target)
    }
}
