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
            alert()
            return
        }
        updateData()
        goBackToMainTabBar()
    }
    @IBAction func hapusTapped(_ sender: Any) {
        dataImpianByUser.remove(at: indexSection!)
        goBackToMainTabBar()
    }
    
    @IBOutlet var deleteButton: UIButton!
    fileprivate func goBackToMainTabBar() {
        let viewController = MainTabBarController(nibName: String(describing: MainTabBarController.self), bundle: nil)
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .flipHorizontal
        self.present(viewController, animated: true, completion: nil)
    }
    
    fileprivate func updateData() {
        dataImpianByUser[indexSection!] = [ImpianByUser(title: judulField.text!, amount: Amount(current: impianData[0].amount.current, target: Int(targetImpian.text!)!))]
    }
    
    private func alert() {
        let alert = UIAlertController(title: "Bad Request", message: "Tolong masukkan data dengan lengkap", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        deleteButton.layer.borderWidth = 3
        deleteButton.layer.borderColor = UIColor(red: 0.922, green: 0.341, blue: 0.341, alpha: 1).cgColor
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        judulField.text = impianData[0].title
        targetImpian.text = String(impianData[0].amount.target)

        // Do any additional setup after loading the view.
    }

}
