//
//  ImageViewController.swift
//  SlideshowApp
//
//  Created by Akira Kamite on 2018/11/14.
//  Copyright © 2018 araki. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var bigImageView: UIImageView!
    
    var bigImage : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bigImageView.image = bigImage
        
    }
    
    
//    元の画面に戻る
    @IBAction func homeButton(_ sender: Any) {
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
