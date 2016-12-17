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

class ICVenueService: NSObject {
    
static let sharedInstance = ICVenueService()

var userObject: User?
var userFeed: Venue?



// TODO Jason: Create a serice function taht basically requests for yelp venues and passes in: category_filter
     
    func loadInData(url:String){
        Alamofire.request("https://api.yelp.com/v2/search?category_filter=\(url)&location=New+York", method: .get).responseJSON { response in
            
            let data = response.result.value as! NSDictionary
            
            self.userFeed = Mapper<Venue>().map(JSONObject: data)
            
            
            
            //   let venue = self.userFeed?.name
            //   let imageURL = self.userFeed?.imageURL
            //      print(venue)
            //       print(imageURL)
        }
        
        
    }
}
