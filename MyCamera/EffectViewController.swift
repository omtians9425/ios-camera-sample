//
//  EffectViewController.swift
//  MyCamera
//
//  Created by 小俣幸之助 on 2020/01/02.
//  Copyright © 2020 Konosuke-o. All rights reserved.
//

import UIKit

class EffectViewController: UIViewController {

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
    
    var originalImage: UIImage?
    
    @IBOutlet weak var effectiveImage: UIImageView!
    
    @IBAction func effectButtonAction(_ sender: Any) {
    }
    @IBAction func shareButtonAction(_ sender: Any) {
    }
    @IBAction func closeButtonAction(_ sender: Any) {
    }
    
}
