//
//  ProfileViewController.swift
//  MyMonee-Final
//
//  Created by Muhammad Rizki Aprilan on 12/05/21.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers

class ProfileViewController: UIViewController,UIImagePickerControllerDelegate,
                             UINavigationControllerDelegate {
    
    let picker = UIImagePickerController()
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
            textFieldName.text = UserDefaults.standard.string(forKey: "username")
        }
        alert.addTextField { (textFieldDescription : UITextField!) -> Void in
            textFieldDescription.placeholder = "Description"
            textFieldDescription.text = UserDefaults.standard.string(forKey: "description")
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default, handler: { [weak alert] (_) in
            let textFieldName = alert?.textFields![0]
//            profileData.name = textFieldName!.text!
            UserDefaults.standard.set(textFieldName!.text!, forKey: "username")
            self.userName.text = textFieldName!.text!
            
            let textFieldDescription = alert?.textFields![1]
//            profileData.description = textFieldDescription!.text!
            UserDefaults.standard.set(textFieldDescription!.text!, forKey: "description")
            self.descriptionProfile.text = textFieldDescription!.text!
            self.editAccess(isEdit: false)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func editablePictureUser(_ sender: UITapGestureRecognizer) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        picker.modalPresentationStyle = .popover
        present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var  chosenImage = UIImage()
        chosenImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        profileImage.contentMode = .scaleAspectFill
        profileImage.image = chosenImage
        dismiss(animated:true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
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
        self.userName.text = UserDefaults.standard.string(forKey: "username") ?? profileData.name
        self.descriptionProfile.text = UserDefaults.standard.string(forKey: "description") ?? profileData.description
        picker.delegate = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        editAccess(isEdit: false)
    }
}
