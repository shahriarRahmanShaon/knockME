//
//  ViewController.swift
//  knockME
//
//  Created by sergio shaon on 15/12/20.
//

import UIKit
import CLTypingLabel

class ViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "knock Me"
        welcomeLabel.charInterval = 0.8
        
        // additional way to do animation using code
//        welcomeLabel.text = ""
//        var charIndex = 0.0
//        let titleText = "knockME"
//        for letter in titleText{
//            Timer.scheduledTimer(withTimeInterval: 0.2*charIndex, repeats: false) { (timer) in
//                self.welcomeLabel.text?.append(letter)
//            }
//            charIndex += 1
//        }
        
    }


}

