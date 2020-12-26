//
//  ViewController.swift
//  knockME
//
//  Created by sergio shaon on 15/12/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        welcomeLabel.text = ""
        var charIndex = 0.0
        let titleText = "knockME"
        for letter in titleText{
            Timer.scheduledTimer(withTimeInterval: 0.2*charIndex, repeats: false) { (timer) in
                self.welcomeLabel.text?.append(letter)
            }
            charIndex += 1
        }
        
    }


}

