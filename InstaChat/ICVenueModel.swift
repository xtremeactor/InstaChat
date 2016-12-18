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
    open var venueId: String?
    open var name: String?
    open var imageURL: String?
    open var location: Array<AnyObject>?
    open var messages: Array<AnyObject>?

    // init method that's called initially when you invoke Mappable
    public required init?(map: Map) {
        
    }

    // Mappable: mapping method for JSON -> Object
    open func mapping(map: Map) {
        venueId <- map["id"]
        name    <- map["name"]
        imageURL <- map["image_url"]
        location <- map["location.display_address"]
    }
}
