//
//  ProfileViewController.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 12/05/21.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var editName: UIImageView!
    @IBOutlet weak var editPicture: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet var descriptionProfile: UILabel!
    
    @IBAction func editableNameUser(_ sender: UITapGestureRecognizer) {
        let alert = UIAlertController(title: "Edit Profile", message: "Silahkan Isi Nama Anda", preferredStyle: UIAlertController.Style.alert)
        alert.addTextField { (textFieldName : UITextField!) -> Void in
            textFieldName.placeholder = "Name"
            textFieldName.text = profileData.name
        }
        alert.addTextField { (textFieldDescription : UITextField!) -> Void in
            textFieldDescription.placeholder = "Description"
            textFieldDescription.text = profileData.description
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default, handler: { [weak alert] (_) in
            let textFieldName = alert?.textFields![0]
            profileData.name = textFieldName!.text!
            self.userName.text = textFieldName!.text!
            
            let textFieldDescription = alert?.textFields![1]
            profileData.description = textFieldDescription!.text!
            self.descriptionProfile.text = textFieldDescription!.text!
            self.editAccess(isEdit: false)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func editablePictureUser(_ sender: UITapGestureRecognizer) {
        //        let documentPicker = UIDocumentPickerViewController(documentTypes: [kUTTypePNG as String,kUTTypeJPEG as String,kUTTypeImage as String], in: .import)
        //        documentPicker.delegate = self
        //        documentPicker.allowsMultipleSelection = false
        //        present(documentPicker, animated: true, completion: nil)
        
        
    }
    
    fileprivate func editAccess(isEdit:Bool) {
        if isEdit {
            status.text = "Selesai"
            editName.isHidden = false
            editPicture.isHidden = false
            return
        }
        status.text = "Edit"
        editName.isHidden = true
        editPicture.isHidden = true
    }
    
    @IBAction func editClicked(_ sender: UITapGestureRecognizer) {
        if status.text == "Edit"{
            editAccess(isEdit: true)
            return
        }
        editAccess(isEdit: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.cornerRadius = 50.5
        self.userName.text = profileData.name
        self.descriptionProfile.text = profileData.description
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        editAccess(isEdit: false)
    }
}

//extension ProfileViewController: UIDocumentPickerDelegate{
//    private func documentPicker(_ controller: UIDocumentPickerViewController,didPickDocumentAt urls:[URL]) {
//        
//        guard let selectedFileURL = urls.first else {
//            return
//        }
//        // swiftlint:disable:next identifier_name
//        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        let sandboxFileURL = dir.appendingPathComponent(selectedFileURL.lastPathComponent)
//        
//        if FileManager.default.fileExists(atPath: sandboxFileURL.path){
//            print("already exists")
//        }else{
//            do {
//                try FileManager.default.copyItem(at: selectedFileURL, to: sandboxFileURL)
//                print("Copied")
//            } catch  {
//                print("Error: \(error)")
//            }
//        }
//    }
//    
//}


