//
//  EffectViewController.swift
//  MyCamera
//
//  Created by omtians9425 on 2020/01/02.
//  Copyright © 2020 Konosuke-o. All rights reserved.
//

import UIKit

class EffectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        effectiveImage.image = originalImage
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    var originalImage: UIImage?
    
    @IBOutlet weak var effectiveImage: UIImageView!
    
    let filterArray = ["CIPhotoEffectMono",
                       "CIPhotoEffectChrome",
                       "CIPhotoEffectFade",
                       "CIPhotoEffectInstant",
                       "CIPhotoEffectNoir",
                       "CIPhotoEffectTonal",
                       "CIPhotoEffectTransfer",
                       "CISepiaTone"
    ]
    var selectedFilterNumber = 0
    
    @IBAction func effectButtonAction(_ sender: Any) {
        if let image = originalImage {
            let filterName = filterArray[selectedFilterNumber]
            selectedFilterNumber += 1
            if selectedFilterNumber == filterArray.count {
                selectedFilterNumber = 0
            }
            
            let rotate = image.imageOrientation
            let inputImage = CIImage(image: image) // UIImage -> CIImage
            
            guard let effectFilter = CIFilter(name: filterName) else {
                return
            }
            
            effectFilter.setDefaults()
            effectFilter.setValue(inputImage, forKey: kCIInputImageKey)
            
            guard let outputImage = effectFilter.outputImage  else {
                return
            }
            
            let ciContext = CIContext(options: nil)
            
            guard let cgImage = ciContext.createCGImage(outputImage, from: outputImage.extent) else {
                return
            }
            
            effectiveImage.image = UIImage(cgImage: cgImage, scale: 1.0, orientation: rotate)
        }
    }
    @IBAction func shareButtonAction(_ sender: Any) {
        if let shareImage = effectiveImage.image {
            let shareItems = [shareImage]
            
            let controller = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
            
            let button = sender as! UIButton
            controller.popoverPresentationController?.sourceView = button
            present(controller, animated: true, completion: nil)
        }
    }
    @IBAction func closeButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
