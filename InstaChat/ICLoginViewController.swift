//
//  ICLoginViewController.swift
//  InstaChat
//
//  Created by Jason Buchel on 11/27/16.
//  Copyright © 2016 TheAustinSpace. All rights reserved.
//

import UIKit
import FirebaseAuth
import AlertHelperKit
import SwiftyUserDefaults

class ICLoginViewController: UIViewController {
    
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
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

  
    
    
    @IBAction func userLoggedIn(_ sender: AnyObject) {
        let email = emailTextfield.text!
        let password = passwordTextfield.text!
        
        if verifyEmail(email: email) && verifyPassword(password: password) {
            print("this works")
            // Task 4: Submit to firebase
            ICUserService.sharedInstance.signInUser(email: email, password: password, completion: { (error, completed) in
                
                
                if ((error) != nil){
                    AlertHelperKit().showAlert(self, title: "Error", message: "\(error)", button: "Ok")
                }
                else if (completed == true){
                    print("User signed in successfully")
                    
                    // Task 6: Create a new VC that allows for us to push once the user has successfully created an account
                    
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                    
                    
                }
                else{
                    print("User was not signed in successfully")
                }
            })
        } else {
            print ("this fails")
        }
    }
}

