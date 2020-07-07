//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by ryosuke0820 on 2020/07/04.
//  Copyright © 2020 ryosuke.ishihara. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedImg: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Image Viewに画像を設定
        
        imageView.image = selectedImg
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
