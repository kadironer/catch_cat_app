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
    
    var timer = Timer()
    var score = 0
    var counter = 0
    var highScore = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counter = 20
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


}

