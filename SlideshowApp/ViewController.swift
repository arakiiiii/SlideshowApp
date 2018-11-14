//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Akira Kamite on 2018/11/13.
//  Copyright © 2018 araki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: Timer!
    
    var timer_sec: Float = 0
    
    var catImagesNo = 0
    
    let catImages = ["catImageOne" , "catImageTwo" , "catImageThree"]
    
    
    func changegazou(){
        
//        範囲外の数字を範囲内に戻す
        if catImagesNo < 0 {
            catImagesNo = 2
        }else if catImagesNo > 2{
            catImagesNo = 0
        }
    
        let name = catImages[catImagesNo]
        
        let catImage = UIImage(named: name)
        
        imageView.image = catImage
    }
        
        
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = UIImage(named: "catImageOne")
        
        imageView.image = image
        
    }
    
//    画面遷移時にデータを保存する
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let imageViewcontroller:ImageViewController = segue.destination as! ImageViewController
        imageViewcontroller.bigImage = UIImage(named:catImages[catImagesNo])
        
    }
    
//    画像を押すと画面が移る
    @IBAction func imageButton(_ sender: Any) {
        performSegue(withIdentifier: "bigImage", sender: nil)
        self.timer.invalidate()
        self.timer = nil
    }

    
    
//    押すと次の画像に変わる
    @IBAction func nextButton(_ sender: Any) {
        if self.timer == nil{
        catImagesNo += 1
        changegazou()
        }
    }
    
//    押すと前の画像に変わる
    @IBAction func backButton(_ sender: Any) {
        if self.timer == nil{
        catImagesNo -= 1
        changegazou()
        }
    }
    
    
    @objc func updateTimer(_ timer: Timer){
        catImagesNo += 1
        changegazou()
    }
    
    @IBAction func startTimer(_ sender: Any) {
        if self.timer == nil{
         timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        }else{
            self.timer.invalidate()
            self.timer = nil
        }
        
    }
    
//    元の画面に戻る
    @IBAction func move(_ segue: UIStoryboardSegue){
    }

}

