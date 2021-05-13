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
    
    @IBAction func editableNameUser(_ sender: UITapGestureRecognizer) {
        let alert = UIAlertController(title: "Edit Profile", message: "Silahkan Isi Nama Anda", preferredStyle: UIAlertController.Style.alert)
        alert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "New Name"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            profileData.name = textField!.text!
            self.userName.text = textField!.text!
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func editablePictureUser(_ sender: UITapGestureRecognizer) {
        let documentPicker = UIDocumentPickerViewController(documentTypes: [kUTTypePNG as String,kUTTypeJPEG as String,kUTTypeImage as String], in: .import)
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false
        present(documentPicker, animated: true, completion: nil)
    }
    
    @IBAction func editClicked(_ sender: UITapGestureRecognizer) {
        if status.text == "Edit"{
            status.text = "Selesai"
            editName.isHidden = false
            editPicture.isHidden = false
        }else{
            status.text = "Edit"
            editName.isHidden = true
            editPicture.isHidden = true
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.cornerRadius = 50.5
        self.userName.text = profileData.name
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        status.text = "Edit"
        editName.isHidden = true
        editPicture.isHidden = true
    }
}

extension ProfileViewController: UIDocumentPickerDelegate{
    private func documentPicker(_ controller: UIDocumentPickerViewController,didPickDocumentAt urls:[URL]) {
        
        guard let selectedFileURL = urls.first else {
            return
        }
        // swiftlint:disable:next identifier_name
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let sandboxFileURL = dir.appendingPathComponent(selectedFileURL.lastPathComponent)
        
        if FileManager.default.fileExists(atPath: sandboxFileURL.path){
            print("already exists")
        }else{
            do {
                try FileManager.default.copyItem(at: selectedFileURL, to: sandboxFileURL)
                print("Copied")
            } catch  {
                print("Error: \(error)")
            }
        }
    }
    
}


