//
//  ICVenueModel.swift
//  InstaChat
//
//  Created by Benjamin Tan on 12/11/16.
//  Copyright © 2016 TheAustinSpace. All rights reserved.
//

import ObjectMapper

//TODO: Jason:  Implement venue model using object mapper

// Defined properties
class Venue: Mappable {

open var name: String?
open var imageURL: String

// Custom init method for setting properties
    open func initWithValues(name: String, imageURL: String){
    self.name = name
self.imageURL = imageURL
}

// init method that's called initially when you invoke Mappable
public required init?(map: Map) {
    
}
    

// Mappable: mapping method for JSON -> Object
open func mapping(map: Map) {
name    <- map["name"]
imageURL <- map["image_url"]
    
    
}}
