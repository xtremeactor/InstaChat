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

class ICWelcomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITabBarDelegate {
    
    var userObject: User?
    var userFeedArray: [Venue] = []
    
    var str:String = ""
    var venueimageURL: URL!
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var searchView: UIView!
    
    override func viewDidLoad() {
        loadInUser()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.setHidesBackButton(true, animated: true)
        searchView.isHidden = true
        tabBar.delegate = self
        tabBar.selectedItem = tabBar.items![0]
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 0:
            searchView.isHidden = true
        case 1:
            searchView.isHidden = false
        default:
            searchView.isHidden = true
        }
    }
    
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
        let venueLocation = userFeedArray[indexPath.row].location as! Array<String>
        cell.venueLocation.text = ("\(venueLocation[0]) \(venueLocation[1])")
        cell.messageButton.tag = indexPath.row  
        cell.messageButton.addTarget(self, action: #selector(ICWelcomeViewController.showMessageVC(sender:)), for: .touchUpInside)
        
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
                    self.tableView.reloadData()

                    
                })

            }
        }
    }
    
    func showMessageVC(sender: UIButton){
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ICMessageViewController") as! ICMessageViewController
        vc.userObject = userObject
        vc.venueObject = userFeedArray[sender.tag]
        present(vc, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "searchSegue" {
//            let vc = segue.destination as! ICSearchViewController
//            vc.searchDelegate =
//        }
    }
}
