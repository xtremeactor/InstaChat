//
//  ICHelper.swift
//  InstaChat
//
//  Created by Jason Buchel on 11/27/16.
//  Copyright © 2016 TheAustinSpace. All rights reserved.
//

import Foundation

class ICHelper {

    static func verifyEmail(email: String) -> Bool {
        // Task 1: Verify that email is an actual email. Things to check are: .com, .net, .co, includes @ and check the textfield is blank
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
        
    }
    
    
    static func verifyPassword(password: String) -> Bool {
        // Task 2: Check for password: requirements: min length of 6 characters
        
        if password.characters.count > 6 {
            return true
        } else {
            return false
        }
        
    }
    
    static func checkingUsername(string: String) -> Bool {
        // Task 3: Ensure that the username only allows alphanumeric characters
        // return true if its a alphanumeric, return false if not        
        if (string.rangeOfCharacter(from: NSCharacterSet.letters.inverted) != nil && string.rangeOfCharacter(from: NSCharacterSet.decimalDigits.inverted) != nil){
            return false
        }
        return true
    }
    
    

    }

