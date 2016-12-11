//
//  ICUserService.swift
//  InstaChat
//
//  Created by Benjamin Tan on 11/27/16.
//  Copyright © 2016 TheAustinSpace. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import SwiftyUserDefaults

class ICUserService: NSObject {
    static let sharedInstance = ICUserService()
    
    func registerUser(email: String, password: String, username: String, completion: @escaping (NSError?, Bool) -> Void){
        // Firebase methods
        
        FIRAuth.auth()?.createUser(withEmail: email, password: password) { (user, error) in
            if ((error) != nil) {
                completion(error as NSError?, false)
            }
            else{
                print(user!)
                Defaults[.user_id] = user?.uid
                completion(nil, true)
            }
        }
    }
    
    
    
    func signInUser(email: String, password: String, completion: @escaping (NSError?, Bool) -> Void){
    // Task 8: Create signInUser function and firebase method for signing user in
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password) { (user, error) in                        
            if ((error) != nil) {
                completion(error as NSError?, false)
            }
            else{
                print(user!)
                Defaults[.user_id] = user?.uid
                completion(nil, true)
                
              
            
                
            }
        }
    }
 
    
    func savePreference(){
        let food = selectedCategories[0]
        FIRAnalytics.setUserPropertyString(food, forName: "Preference")
        
    }
    
    // Create a new service function that updates the users category preferences. 
    
    /*
     {
         "users": {
             "jason": {
                "name": "Ada Lovelace",
                "email": "123123123123",
                "preferences": [rooftopbar, ]
             },
             ....
        }
     }
 */
    
   
}
