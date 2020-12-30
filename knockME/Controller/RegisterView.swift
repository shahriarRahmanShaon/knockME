//
//  RegisterView.swift
//  knockME
//
//  Created by sergio shaon on 26/12/20.
//


import UIKit
import Firebase

class Register: UIViewController {
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerPressed(_ sender: Any) {
        
        if let email = emailField.text , let password = passwordField.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                }else{
                    self.performSegue(withIdentifier: K.segueIdentifier.registerSegue, sender: self)
                }
            }

    }
    
}
}
