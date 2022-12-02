//
//  ViewController.swift
//  catch_cat_app
//
//  Created by Kadir on 2.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var score_label: UILabel!
    @IBOutlet weak var time_label: UILabel!
    @IBOutlet weak var highScore_label: UILabel!
    
    
    @IBOutlet weak var kedi1: UIImageView!
    @IBOutlet weak var kedi2: UIImageView!
    @IBOutlet weak var kedi3: UIImageView!
    @IBOutlet weak var kedi4: UIImageView!
    @IBOutlet weak var kedi5: UIImageView!
    @IBOutlet weak var kedi6: UIImageView!
    @IBOutlet weak var kedi7: UIImageView!
    @IBOutlet weak var kedi8: UIImageView!
    @IBOutlet weak var kedi9: UIImageView!
    
    
    var timer = Timer()
    var hideTimer = Timer()
    var score = 0
    var counter = 0
    var highScore = 0
    var kediArray = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedHighScore = UserDefaults.standard.object(forKey: "highScoreKey")
        
        if storedHighScore == nil {
            highScore = 0
            highScore_label.text = "En Yüksek Skor: \(highScore)"
        }
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            highScore_label.text = "En Yüksek Skor: \(highScore)"
        }
        
        
        kedi1.isUserInteractionEnabled = true
        kedi2.isUserInteractionEnabled = true
        kedi3.isUserInteractionEnabled = true
        kedi4.isUserInteractionEnabled = true
        kedi5.isUserInteractionEnabled = true
        kedi6.isUserInteractionEnabled = true
        kedi7.isUserInteractionEnabled = true
        kedi8.isUserInteractionEnabled = true
        kedi9.isUserInteractionEnabled = true
        
        let gestureCats1 = UITapGestureRecognizer(target: self, action: #selector(scoreArttır))
        let gestureCats2 = UITapGestureRecognizer(target: self, action: #selector(scoreArttır))
        let gestureCats3 = UITapGestureRecognizer(target: self, action: #selector(scoreArttır))
        let gestureCats4 = UITapGestureRecognizer(target: self, action: #selector(scoreArttır))
        let gestureCats5 = UITapGestureRecognizer(target: self, action: #selector(scoreArttır))
        let gestureCats6 = UITapGestureRecognizer(target: self, action: #selector(scoreArttır))
        let gestureCats7 = UITapGestureRecognizer(target: self, action: #selector(scoreArttır))
        let gestureCats8 = UITapGestureRecognizer(target: self, action: #selector(scoreArttır))
        let gestureCats9 = UITapGestureRecognizer(target: self, action: #selector(scoreArttır))
        
        kedi1.addGestureRecognizer(gestureCats1)
        kedi2.addGestureRecognizer(gestureCats2)
        kedi3.addGestureRecognizer(gestureCats3)
        kedi4.addGestureRecognizer(gestureCats4)
        kedi5.addGestureRecognizer(gestureCats5)
        kedi6.addGestureRecognizer(gestureCats6)
        kedi7.addGestureRecognizer(gestureCats7)
        kedi8.addGestureRecognizer(gestureCats8)
        kedi9.addGestureRecognizer(gestureCats9)
        
        kediArray = [kedi1, kedi2, kedi3, kedi4, kedi5, kedi6, kedi7, kedi8, kedi9]
        
        
        counter = 15
        score = 0
        score_label.text = "Skor: \(score)"
        time_label.text = "\(counter)"
        highScore_label.text = "En Yüksek Skor: \(highScore)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(cathCatsFunc), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideCats), userInfo: nil, repeats: true)
        
    }
    @objc func hideCats() {
        
        for kediler in kediArray {
            kediler.isHidden = true
            
        }
        let random = Int(arc4random_uniform(UInt32(kediArray.count-1)))
        kediArray[random].isHidden = false
        
    }
    
    @objc func cathCatsFunc(){
        counter = counter - 1
        time_label.text = "\(counter)"
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            time_label.text = "Süre Bitti"
            
            
            if self.score > self.highScore {
                self.highScore = self.score
                highScore_label.text = "En Yüksek Skor: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highScoreKey")
            }
            
            let alert = UIAlertController(title: "Süre Bitti", message: "Süreniz Bitti Skorunuz: \(score)", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel)
            let restartButton = UIAlertAction(title: "Yeniden Başla", style: UIAlertAction.Style.default) { UIAlertAction in
                
                self.score = 0
                self.score_label.text = "Skor: \(self.score)"
                self.counter = 15
                self.time_label.text = "\(self.counter)"
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.cathCatsFunc), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideCats), userInfo: nil, repeats: true)
                
                
            }
            for kediler in kediArray {
                kediler.isHidden = true
                
            }
            alert.addAction(restartButton)
            alert.addAction(okButton)
            self.present(alert, animated: true)
        }
    }
    
    @objc func scoreArttır(){
        score = score + 1
        score_label.text = "Skor: \(score)"
    }


}

