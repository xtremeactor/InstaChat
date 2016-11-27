//
//  ICSignupViewController.swift
//  InstaChat
//
//  Created by Benjamin Tan on 11/20/16.
//  Copyright © 2016 TheAustinSpace. All rights reserved.
//

import UIKit
import FirebaseAuth

class ICSignupViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Task 3: Ensure that the username only allows alphanumeric characters
        // return true if its a alphanumeric, return false if not
        
        return true
    }
    
    func verifyPassword(password: String) -> Bool {
        let password = passwordTextfield.text
        
        if password?.characters.count > 6 {
            return true
        } else {
            return false
        }
        
    }
    
    func verifyEmail(password: String) -> Bool {
        let email = emailTextfield.text
        
        if password?.characters.count > 6 {
            return true
        } else {
            return false
        }
        
    }
    
    
    
    
    @IBAction func signupPressed(_ sender: Any) {
        
        
        // Task 1: Verify that email is an actual email. Things to check are: .com, .net, .co, includes @ and check the textfield is blank
        
      
        
        // Task 2: Check for password: requirements: min length of 6 characters
        
        
        // Task 4: Submit to firebase
        /*
         FIRAuth.auth()?.createUser(withEmail: email, password: password) { (user, error) in
         // ...
         
         //Task 5: Store the "user id" as Defaults[.user_id]
         https://github.com/radex/SwiftyUserDefaults
         }
         */
        
    

    }
    
    
    
    
}
