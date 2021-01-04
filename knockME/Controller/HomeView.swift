//
//  HomeView.swift
//  knockME
//
//  Created by sergio shaon on 26/12/20.
//

import UIKit
import Firebase


class HomeView: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    let db = Firestore.firestore()
    
    var message : [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTextField.delegate = self
        // accepting datasource dalegete
        tableView.dataSource = self
        navigationItem.hidesBackButton = true
        title = "Knock Me"
        // registering newly created nib file
        tableView.register(UINib(nibName: K.nibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier.reusableCell)
        //loading chat data whenever one opens up the app
        loadData()
    }
    //MARK:- data send and load
    
    func loadData() {
       
        let docRef = db.collection(K.FStore.collectionName)
        docRef.order(by: "time").addSnapshotListener { (snapShot, error) in
            if let e = error {
                print(e)
            }else{
                if let dataSnapShot = snapShot?.documents{
                    self.message = []
                    for doc in dataSnapShot{
                        let data = doc.data()
                        if let sender = data["senderName"] as?String, let body = data["message"] as? String {
                            let newMessage = Message(sender: sender, body: body)
                            self.message.append(newMessage)
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                            
                        }
                    }
                }
               
            }
        }
        
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        if  let messageBody = messageTextField.text , let messageSender = Auth.auth().currentUser?.email{
            db.collection(K.FStore.collectionName).addDocument(data: [
                "senderName" : messageSender,
                "message"    : messageBody,
                "time"       : Date().timeIntervalSince1970
            ]) { (error) in
                if let e = error {
                    print("hoynai firestore er kaj \(e)")
                }else{
                    print("yes, you did it")
                }
               
            }
        }
        messageTextField.text = ""
    }
   //MARK:- logout button work
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

