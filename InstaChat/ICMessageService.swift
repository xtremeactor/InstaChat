//
//  ICMessageService.swift
//  InstaChat
//
//  Created by Benjamin Tan on 12/18/16.
//  Copyright © 2016 TheAustinSpace. All rights reserved.
//

import UIKit
import Firebase
import ObjectMapper

class ICMessageService: NSObject {
    static let sharedInstance = ICMessageService()
    let ref: FIRDatabaseReference! = FIRDatabase.database().reference()

    func addMessage(username: String, message: String, venueId: String, date: UInt64, completion: @escaping (NSError?, Bool) -> Void){
        // FIrebase method for adding a user record to DB
        let post = ["username": username, "message": message]
        self.ref.child("venue/\(venueId)/\(date)").setValue(post)
        // https://instachat-25d03.firebaseio.com/users/ygGpovmTtFRkQDoLvP6YzU1tb8F3/email
        completion(nil, true)
    }
    
    func getPreviousMessages(venueId: String, completion: @escaping (NSError?, Bool, Array<Message>) -> Void){
        ref.child("venue/\(venueId)").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            var messagesArray:[Message] = []
            let value = snapshot.value as? Dictionary<String, AnyObject> ?? [:]
            
            for message in value {
                let messageObject = Mapper<Message>().map(JSONObject: message.value)
                messagesArray.append(messageObject!)
            }
            completion(nil, true, messagesArray)
        }) { (error) in
            print(error.localizedDescription)
            completion(error as NSError?, false, [])
        }

    }
}

