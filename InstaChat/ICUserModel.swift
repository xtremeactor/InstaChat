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
    var username: String?
    var email: String?
    var preferences: [String]?
    
    // Custom init method for setting properties
    public init(username: String, email: String, preferences: Array<String>){
        self.username = username
        self.email = email
        self.preferences = preferences
    }
    
    // init method that's called initially when you invoke Mappable
    public required convenience init?(map: Map) {
        self.init()
    }
    
    // Mappable: mapping method for JSON -> Object
    func mapping(map: Map) {
        username    <- map["username"]
        email       <- map["email"]
        preferences <- map["preferences"]
        
    }
    
    
}
