//
//  ICMessageViewController.swift
//  InstaChat
//
//  Created by Benjamin Tan on 12/18/16.
//  Copyright © 2016 TheAustinSpace. All rights reserved.
//

import UIKit
import AlertHelperKit
import ObjectMapper

class ICMessageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    var userObject: User?
    var venueObject: Venue?
    var messages: [Message] = []
    
    @IBOutlet weak var messageTableView: UITableView!
    @IBOutlet weak var messageToolbar: UIToolbar!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var sendMessageButton: UIBarButtonItem!
    @IBOutlet weak var toolbarBottomConstraint: NSLayoutConstraint!
    
    @IBAction func sendMessageButtonPressed(_ sender: Any) {
        var timestamp = UInt64(floor(Date().timeIntervalSince1970 * 1000))
        ICMessageService.sharedInstance.addMessage(username: (userObject?.username)!, message: self.inputTextField.text!, venueId: (venueObject?.venueId)!, date: timestamp) { (error, isCompleted) in
            if (error == nil && isCompleted == true){
//                let message = Message(JSONString: "{}")
//                message?.username = self.userObject?.username!
//                message?.message = self.inputTextField.text!
//                message?.datetime = timestamp
                self.inputTextField.text = ""
                self.inputTextField.resignFirstResponder()
                self.loadInMessages()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTableView.delegate = self
        messageTableView.dataSource = self
        inputTextField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(ICMessageViewController.showKeyboard(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ICMessageViewController.hideKeyboard(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        loadInMessages()
    }

    func loadInMessages(){
        ICMessageService.sharedInstance.getPreviousMessages(venueId: (venueObject?.venueId)!) { (error, isCompleted, messageArray) in
            if error == nil && isCompleted == true {
                self.messages.removeAll()
                self.messages = messageArray
                self.messageTableView.reloadData()
            }
        }
    }
    func showKeyboard(notification: NSNotification) {
        //notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height
        let keyboardSize = notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as! NSValue
        toolbarBottomConstraint.constant = keyboardSize.cgRectValue.size.height
    }
    
    func hideKeyboard(notification: NSNotification) {
        toolbarBottomConstraint.constant = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! ICMessageTableViewCell
        cell.usernameLabel.text = messages[indexPath.row].username!
        cell.messageTextView.text = messages[indexPath.row].message!
        return cell
    }
}
