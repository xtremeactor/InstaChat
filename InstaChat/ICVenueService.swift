//
//  ICVenueService.swift
//  InstaChat
//
//  Created by Benjamin Tan on 12/11/16.
//  Copyright © 2016 TheAustinSpace. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import SwiftyUserDefaults

class ICVenueService: NSObject {
    
static let sharedInstance = ICVenueService()

var userObject: User?
var userFeedArray: [Venue] = []

// TODO Jason: Create a serice function taht basically requests for yelp venues and passes in: category_filter
     
    func loadinHomefeedData(categoryParams:String){
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(Defaults[.access_token]!)",
            "Accept": "application/json"
        ]
        Alamofire.request("https://api.yelp.com/v3/businesses/search?categories=\(categoryParams)&location=New+York", method: .get, headers: headers).responseJSON { response in
            
            let data = response.result.value as! NSDictionary
            let businessArray = data["businesses"] as! Array<AnyObject>
            for business in businessArray {
                let venue = Mapper<Venue>().map(JSONObject: business)
                self.userFeedArray.append(venue!)
                print(self.userFeedArray)
                //self.userFeed = Mapper<Venue>().map(JSONObject: data)
            }
            
            
            //   let venue = self.userFeed?.name
            //   let imageURL = self.userFeed?.imageURL
            //      print(venue)
            //       print(imageURL)
        }
        
        
    }
}
