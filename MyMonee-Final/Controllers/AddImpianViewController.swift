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
            alert()
            return
        }
        insertData()
        goBackToMainTabBar()
    }
    
    @IBAction func back(_ sender: Any) {
        let viewController = MainTabBarController(nibName: String(describing: MainTabBarController.self), bundle: nil)
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .flipHorizontal
        self.present(viewController, animated: true, completion: nil)
    }
    
    fileprivate func insertData() {
        dataImpianByUser.append([ImpianByUser(title: titleImpian.text!, amount: Amount(current: 0, target: Int(targetImpian.text!)!))])
    }
    
    fileprivate func goBackToMainTabBar() {
        let viewController = MainTabBarController(nibName: String(describing: MainTabBarController.self), bundle: nil)
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .flipHorizontal
        self.present(viewController, animated: true, completion: nil)
    }
    
    private func alert() {
        let alert = UIAlertController(title: "Bad Request", message: "Tolong masukkan data dengan lengkap", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
