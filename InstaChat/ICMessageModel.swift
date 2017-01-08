//
//  ICMessageModel.swift
//  InstaChat
//
//  Created by Benjamin Tan on 12/18/16.
//  Copyright © 2016 TheAustinSpace. All rights reserved.
//

import ObjectMapper

// Defined properties
class Message: Mappable {
    
    open var username: String?
    open var message: String?
    open var datetime: UInt64?
    
    open func initWithValues(_ username: String, message: String){
        self.username = username
        self.message = message
    }
    
    // init method that's called initially when you invoke Mappable
    public required init?(map: Map) {
        
    }
    
    // Mappable: mapping method for JSON -> Object
    open func mapping(map: Map) {
        username    <- map["username"]
        message     <- map["message"]
        datetime    <- map["timestamp"]
    }
}
