//
//  ICUserService.swift
//  InstaChat
//
//  Created by Benjamin Tan on 11/27/16.
//  Copyright © 2016 TheAustinSpace. All rights reserved.
//

import UIKit
import FirebaseAuth

class ICUserService: NSObject {
    static let sharedInstance = ICUserService()
    
    func registerUser(email: String, password: String, username: String, completion: @escaping (NSError?, Bool) -> Void){
        // Firebase methods
        
        FIRAuth.auth()?.createUser(withEmail: email, password: password) { (user, error) in
            if ((error) != nil) {
                completion(error as NSError?, false)
            }
            else{
                print(user)
                completion(nil, true)
            }
        }
    }
    
    
    func testFunction(input: String) -> String{
        return "String"
    }
    

}
