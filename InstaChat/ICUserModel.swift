//
//  ICUserModel.swft.swift
//  InstaChat
//
//  Created by Benjamin Tan on 12/11/16.
//  Copyright © 2016 TheAustinSpace. All rights reserved.
//

import ObjectMapper

class User: Mappable {
    // Defined properties
    open var username: String?
    open var email: String?
    open var preferences: [String]?
    
    // Custom init method for setting properties
    open func initWithValues(username: String, email: String, preferences: Array<String>){
        self.username = username
        self.email = email
        self.preferences = preferences
    }
    
    // init method that's called initially when you invoke Mappable
    public required init?(map: Map) {
        
    }
    
    // Mappable: mapping method for JSON -> Object
    open func mapping(map: Map) {
        username    <- map["username"]
        email       <- map["email"]
        preferences <- map["preferences"]
        
    }
    
    
}
