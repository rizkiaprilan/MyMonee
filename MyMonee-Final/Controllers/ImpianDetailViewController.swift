//
//  ImpianDetailViewController.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 14/05/21.
//

import UIKit

class ImpianDetailViewController: UIViewController {

    @IBOutlet weak var confirmationButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    override func viewWillAppear(_ animated: Bool) {
        backButton.layer.borderWidth = CGFloat(3)
        backButton.layer.borderColor = CGColor(red: 80, green: 105, blue: 184, alpha: 1)
        backButton.layer.cornerRadius = 20
        
        confirmationButton.layer.borderWidth = CGFloat(3)
        confirmationButton.layer.backgroundColor = CGColor(red: 80, green: 105, blue: 184, alpha: 1)
        confirmationButton.layer.cornerRadius = 20
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
