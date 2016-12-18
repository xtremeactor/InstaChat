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
    
    func authenticateYelp(completion: @escaping (NSError?, Bool) -> Void){
        // Send a POST request using AF to https://api.yelp.com/oauth2/token
        // with client id and client secret
        
        
        // Store the access token in NSdefaults as well as FB
        
        let parameters: Parameters = ["grant_type": "client_credentials", "client_id": Constants.CLIENT_ID, "client_secret": Constants.CLIENT_SECRET]
        
        
        //     Alamofire.request("https://api.yelp.com/oauth2/token", method: .post).responseJSON { response in
        
        Alamofire.request("https://api.yelp.com/oauth2/token", method: .post, parameters: parameters).responseJSON { response in
            
             if (response.response?.statusCode == 200){
                let data = response.result.value as! NSDictionary
                let accessToken = data.object(forKey: "access_token") as! String
                    
                print("here is the \(accessToken)")
                // Rename this to yelp access token
                Defaults[.access_token] = accessToken
                completion(nil, true)
                
             }
             else {
                print("Error")
                completion(response.result.error as NSError?, false)        
            }
        }
    }
}

