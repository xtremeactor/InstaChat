//
//  ICCategorySelectionViewController.swift
//  InstaChat
//
//  Created by Benjamin Tan on 11/27/16.
//  Copyright © 2016 TheAustinSpace. All rights reserved.
//

import UIKit

class ICCategorySelectionViewController: UIViewController, UICollectionViewDelegate {
    
    // HW Task 9: Create the UI for the Category selection VC, compile a list of categories, and populate them into an array and into the collection view. Set the collection view to have 2 cells across. Implement selected collection view delegate method for choosing multiple categories
    
    // HW Task 10: Setup homefeed to copy instagram layout. You will have a username label at the top, a imageview in the center, and two buttons on the bottom (like and message). Embed in a navigation controller
    
    // HW Task 11: Signup for pixabay api key and familiarize yourself with their api
    
    
    var categoriesArray = ["Planets"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
