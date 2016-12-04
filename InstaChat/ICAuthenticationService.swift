//
//  ICAuthenticationService.swift
//  InstaChat
//
//  Created by Benjamin Tan on 12/4/16.
//  Copyright © 2016 TheAustinSpace. All rights reserved.
//

import UIKit
import Alamofire
import FirebaseDatabase
import SwiftyUserDefaults

class ICAuthenticationService: NSObject {
    static let sharedInstance = ICAuthenticationService()
    
    func authenticateUser(){
        // Send a POST request using AF to https://api.yelp.com/oauth2/token
        // with client id and client secret
        
        
        // Store the access token in NSdefaults as well as FB
        
        let parameters: Parameters = ["client_ID": "client_SECRET"]
        
        
        //     Alamofire.request("https://api.yelp.com/oauth2/token", method: .post).responseJSON { response in
        
        Alamofire.request("https://api.yelp.com/oauth2/token", method: .post, parameters: parameters).responseJSON { response in
            
             if (response.response?.statusCode == 200){
                
            let data = response.result.value as! NSDictionary
                
            let accessToken = data.object(forKey: "access_token")
                
            print(accessToken)
                
          }  else {
            print("Error")

                    
          //  Defaults[.access_token] = user?.access_token
                

                
                
        
    }
}
}
}

