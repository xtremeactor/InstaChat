//
//  ICWelcomeViewController.swift
//  InstaChat
//
//  Created by Jason Buchel on 11/27/16.
//  Copyright © 2016 TheAustinSpace. All rights reserved.
//

import UIKit
import ObjectMapper
import SwiftyUserDefaults
import AlertHelperKit
import Alamofire
import SDWebImage

class ICWelcomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var userObject: User?
    var userFeedArray: [Venue] = []
    
    var str:String = ""
    var venueimageURL: URL!
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        loadInUser()
    }

    // TODO Benny: Call FB for user data and map to our User object
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userFeedArray.count

    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! tableView
        
        let venueName = userFeedArray[indexPath.row].name
       cell.venueLabel.text = venueName

        let venueImage = userFeedArray[indexPath.row].imageURL
       venueimageURL=URL(string:venueImage!)!
       
       cell.venueImage.sd_setImage(with: venueimageURL, placeholderImage:UIImage(named:"placeholder.png"))
        
        let venueLocation = userFeedArray[indexPath.row].location
        
        cell.venueLocation.text = venueLocation
        
        cell.venueLocation.text = "test"
        
       return cell

    }
    
    func loadInUser() {
        let userId = Defaults[.user_id]        
        // We are creating/updating the User Object by grabbing the user info from Firebase
        ICUserService.sharedInstance.getUserFromFirebase(userId: userId!) { (error, completed, responseDict) in
            if error != nil {
                AlertHelperKit().showAlert(self, title: "Error", message: "\(error)", button: "Ok")
            } else {
                print(responseDict)
                // Direct mapping of the responseDict into our User model
                self.userObject = Mapper<User>().map(JSON: responseDict)
                // Now we have the preferences of our user!
                self.getPreferenceAndLoadFeed()
                
            }
        }
      }
               
    /*
     ToDO Jason: Access the preference property of the User object, extract all the preferences
     and append them as a single string separated by commas with no space ("bars,french") */
    
    func getPreferenceAndLoadFeed(){
        let array = userObject?.preferences ?? []
        for i in 0..<array.count {
            str.append("\(array[i]),")
            if i == array.count - 1 {
                str.characters.removeLast()
                //Make yelp call here to load feed
                ICVenueService.sharedInstance.loadinHomefeedData(categoryParams: str, completion: { (error, isCompleted, venueArray) in
                    if (error == nil && isCompleted == true) {
                        self.userFeedArray.removeAll()
                        self.userFeedArray = venueArray
                         self.tableView.reloadData()
                    }
                    print("testing 123 \(self.userFeedArray[1].name)")
                    self.tableView.reloadData()

                    
                })

            }
        }
    }
   }
