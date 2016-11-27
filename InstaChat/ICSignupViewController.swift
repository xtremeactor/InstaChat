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
        self.usernameTextfield.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (ICHelper.checkingUsername(string: string)){
            return true
        } else{
            return false
        }
        
    }
    
    @IBAction func signupPressed(_ sender: Any) {
        let email = emailTextfield.text!
        let password = passwordTextfield.text!
        let username = usernameTextfield.text!
        
        if (ICHelper.verifyEmail(email: email) && ICHelper.verifyPassword(password: password)){
            // Task 4: Submit to firebase
            ICUserService.sharedInstance.registerUser(email: email, password: password, username: username, completion: { (error, completed) in
                if ((error) != nil){
                    AlertHelperKit().showAlert(self, title: "Error", message: "\(error)", button: "Ok")
                }
                else if (completed == true){
                    print("User was created successfully")

                    // Task 6: Create a new VC that allows for us to push once the user has successfully created an account
                    self.performSegue(withIdentifier: "welcomeSegue", sender: nil)
                }
                else{
                    print("User was not created")
                }
            })
        }
        else {
            print ("this fails")
        }
    }
}
