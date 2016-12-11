//
//  ICWelcomeViewController.swift
//  InstaChat
//
//  Created by Jason Buchel on 11/27/16.
//  Copyright © 2016 TheAustinSpace. All rights reserved.
//

import UIKit
import ObjectMapper
import SwiftyUserDefaults
import AlertHelperKit

class ICWelcomeViewController: UIViewController {
    
    var userObject: User?
    
    override func viewDidLoad() {
        loadInUser()
    }

    // TODO Benny: Call FB for user data and map to our User object
    
    func loadInUser() {
        let userId = Defaults[.user_id]
        // We are creating/updating the User Object by grabbing the user info from Firebase
        ICUserService.sharedInstance.getUserFromFirebase(userId: userId!) { (error, completed, responseDict) in
            if error != nil {
                AlertHelperKit().showAlert(self, title: "Error", message: "\(error)", button: "Ok")
            } else {
                print(responseDict)
                // Direct mapping of the responseDict into our User model
                self.userObject = Mapper<User>().map(JSON: responseDict)
                // Now we have the preferences of our user!
                let preferences = self.userObject?.preferences
                print(preferences!)
            }
            
        }
    }

    
    /*
     ToDO Jason: Access the preference property of the User object, extract all the preferences
     and append them as a single string separated by commas with no space ("bars,french")
     
     */
    
    /*
     Make a call to yelp
     */
    
    

}
