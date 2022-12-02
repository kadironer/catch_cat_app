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
    var score = 0
    var counter = 0
    var highScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        counter = 10
        score = 0
        score_label.text = "Skor: \(score)"
        time_label.text = "\(counter)"
        highScore_label.text = "En Yüksek Skor: \(highScore)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(cathCatsFunc), userInfo: nil, repeats: true)
    }
    
    @objc func cathCatsFunc(){
        counter = counter - 1
        time_label.text = "\(counter)"
        if counter == 0 {
            timer.invalidate()
            let alert = UIAlertController(title: "Süre Bitti", message: "Süreniz Bitti Skorunuz: \(score)", preferredStyle: UIAlertController.Style.alert)
            let restartButton = UIAlertAction(title: "Yeniden Başla", style: UIAlertAction.Style.default)
            alert.addAction(restartButton)
            self.present(alert, animated: true)
        }
    }
    
    @objc func scoreArttır(){
        score = score + 1
        score_label.text = "Skor: \(score)"
    }


}

