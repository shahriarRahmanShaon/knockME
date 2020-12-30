//
//  HomeView.swift
//  knockME
//
//  Created by sergio shaon on 26/12/20.
//

import UIKit
import Firebase

class HomeView: UIViewController {
    
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    let db = Firestore.firestore()
    var message : [Message] = [
        Message(sender: "shaon", body: "hi"),
        Message(sender: "shihab", body: "jio"),
        Message(sender: "kihab", body: "hhhhhhhhhhhhhhhhhhhhhhhhhhhuuuuuuuuuuiiiiiiiii")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // accepting datasource dalegete
        tableView.dataSource = self
        navigationItem.hidesBackButton = true
        title = "Knock Me"
        // registering newly created nib file
        tableView.register(UINib(nibName: K.nibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier.reusableCell)
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        if  let messageBody = messageTextField.text , let messageSender = Auth.auth().currentUser?.email{
            db.collection(K.FStore.collectionName).addDocument(data: [
                "senderName" : messageSender,
                "message"    : messageBody
            ]) { (error) in
                if let e = error {
                    print("hoynai firestore er kaj \(e)")
                }else{
                    print("yes, you did it")
                }
               
            }
        }
    }
   
    @IBAction func logoutPressed(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }
}

//MARK:- tableview management

extension HomeView : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:K.cellIdentifier.reusableCell ,for: indexPath) as! TableViewCell
        cell.cellLabel?.text = message[indexPath.row].body
        return cell
    }
    
    
}
