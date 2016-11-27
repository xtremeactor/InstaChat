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

        
        return true
    }
    
    func verifyEmail(email: String) -> Bool {
        // Task 1: Verify that email is an actual email. Things to check are: .com, .net, .co, includes @ and check the textfield is blank
        let email = emailTextfield.text!
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
        
    }
    
    
    func verifyPassword(password: String) -> Bool {
    // Task 2: Check for password: requirements: min length of 6 characters
        let password = passwordTextfield.text!
        
        if password.characters.count > 6 {
            return true
        } else {
            return false
        }
        
    }
    

    
    func verifyUsername(username: String) -> Bool {
    // Task 3: Ensure that the username only allows alphanumeric characters
    // return true if its a alphanumeric, return false if not
 
        let username = usernameTextfield.text!

        let decimalDigits = CharacterSet.decimalDigits
        
        if (username.rangeOfCharacter(from: decimalDigits) != nil) && username.contains(",./;'!@#$%^&*()"){
            return false
            }     else {
                return true
            }
     }
    
    
    @IBAction func signupPressed(_ sender: Any) {
         let email = emailTextfield.text!
         let password = passwordTextfield.text!
        
        if verifyEmail(email: email) && verifyPassword(password: password) {
            print("this works")
        } else {
            print ("this fails")
        }
        
     
      

        
        
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
