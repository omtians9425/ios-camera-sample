//
//  ViewController.swift
//  MyCamera
//
//  Created by 小俣幸之助 on 2020/01/02.
//  Copyright © 2020 Konosuke-o. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var pictureImage: UIImageView!
    
    @IBAction func cameraButtonAction(_ sender: Any) {
        // alert dialog
        let alertController = UIAlertController(title: "確認", message: "選択してください", preferredStyle: .actionSheet)
        
        // actions
        let cameraAction = UIAlertAction(title: "カメラ", style: .default, handler: nil)
        let photoLibraryAction = UIAlertAction(title: "フォトライブラリー", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        
        alertController.addAction(cameraAction)
        alertController.addAction(photoLibraryAction)
        alertController.addAction(cancelAction)
        
        alertController.popoverPresentationController?.sourceView = view
        
        present(alertController, animated: true, completion: nil)
        
//        if UIImagePickerController.isSourceTypeAvailable(.camera) {
//            print("カメラは利用できます")
//            let imagePickerController = UIImagePickerController()
//            imagePickerController.sourceType = .camera
//            imagePickerController.delegate = self
//            present(imagePickerController, animated: true, completion: nil)
//        } else {
//            print("カメラは利用できません")
//        }
    }
    @IBAction func shareButtonAction(_ sender: Any) {
        if let shareImage = pictureImage.image {
            let shareItems = [shareImage]
            let controller = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
            controller.popoverPresentationController?.sourceView = view
            present(controller, animated: true, completion: nil)
        }
    }
    
    // delegate method
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // set image
        pictureImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        // close modal view
        dismiss(animated: true, completion: nil)
    }
    
}

