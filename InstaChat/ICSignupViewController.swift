//
//  ICSignupViewController.swift
//  InstaChat
//
//  Created by Benjamin Tan on 11/20/16.
//  Copyright © 2016 TheAustinSpace. All rights reserved.
//

import UIKit
import FirebaseAuth
import AlertHelperKit
import SwiftyUserDefaults

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
    
    // Side Task: Create a helper file that contains the verifyEmail and verifyPassword functions
    
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
        let username = usernameTextfield.text!
        
        if verifyEmail(email: email) && verifyPassword(password: password) && verifyUsername(username: username) {
            print("this works")
            // Task 4: Submit to firebase
            ICUserService.sharedInstance.registerUser(email: email, password: password, username: username, completion: { (error, completed) in
                if ((error) != nil){
                    AlertHelperKit().showAlert(self, title: "Error", message: "\(error)", button: "Ok")
                }
                else if (completed == true){
                    print("User was created successfully")
        
                    // Task 6: Create a new VC that allows for us to push once the user has successfully created an account
                    
                }
                else{
                    print("User was not created")
                }
            })
        } else {
            print ("this fails")
        }
    }
}
