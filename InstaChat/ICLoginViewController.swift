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

  
    @IBAction func userLoggedIn(_ sender: AnyObject) {
        let email = emailTextfield.text!
        let password = passwordTextfield.text!
        
        if ICHelper.verifyEmail(email: email) && ICHelper.verifyPassword(password: password) {
            // Task 4: Submit to firebase
            ICUserService.sharedInstance.signInUser(email: email, password: password, completion: { (error, completed) in                                
                if ((error) != nil){
                    AlertHelperKit().showAlert(self, title: "Error", message: "\(error)", button: "Ok")
                }
                else if (completed == true){
                    print("User signed in successfully")                    
                    ICAuthenticationService.sharedInstance.authenticateUser { (error, isCompleted) in
                        if ((error) != nil){
                            AlertHelperKit().showAlert(self, title: "Error", message: "\(error)", button: "Ok")
                        }
                        else if (isCompleted == true){
                            print("its done")
                            if (Defaults[.access_token]?.isEmpty)!{
                                AlertHelperKit().showAlert(self, title: "Error", message: "error", button: "Ok")
                            }
                            else{
                                // Task 6: Create a new VC that allows for us to push once the user has successfully created an account
                                self.performSegue(withIdentifier: "loginToHomeFeedSegue", sender: nil)
                            }
                        }
                        else{
                            AlertHelperKit().showAlert(self, title: "Error", message: "\(error)", button: "Ok")
                        }
                    }
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

