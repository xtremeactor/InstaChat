//
//  ICCategorySelectionViewController.swift
//  InstaChat
//
//  Created by Benjamin Tan on 11/27/16.
//  Copyright © 2016 TheAustinSpace. All rights reserved.
//

import UIKit

var selectedCategories = [String]()


class ICCategorySelectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // HW Task 9: Create the UI for the Category selection VC, compile a list of categories, and populate them into an array and into the collection view. Set the collection view to have 2 cells across. Implement selected collection view delegate method for choosing multiple categories
    
    // HW Task 10: Setup homefeed to copy instagram layout. You will have a username label at the top, a imageview in the center, and two buttons on the bottom (like and message). Embed in a navigation controller
    
    // HW Task 11: Signup for pixabay api key and familiarize yourself with their api
    let categoriesArray = ["Rooftop Bars 🌇","Brunch 🍳","Burgers 🍔","Hidden Gems 🌠","Beer Gardens 🍻","Desserts 🍰","Travel ✈️","Celeb Hot Spots 🍾","Fun Things to Do 🎢","Pizza 🍕","Trendy ✅", "Cocktail Bars 🍸", "Date Spots 🌹", "Arts & Cuture 🏛", "Sports Bars 🏈", "Cheap Eats 💯", "Ice Cream 🍦", "Comfort Food 🍗 ", "Vegetarian/Vegan 🍆", "Workouts 💪",  "Coffee Shops ☕️", "Seafood 🍤 ", "Wine Bars 🍷", "Global Grub 🌏",   "Steals and Deals 💰"]
    let categoriesStringArray = ["rooftop bar", "brunch", "burgers", "hidden gem"]
    
    @IBOutlet var collectionView: UICollectionView!
    
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoriesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "grid", for: indexPath) as! Grid
    let selectedCategory = categoriesArray[indexPath.row]
    cell.categoryLabel.text = selectedCategory
    //Side HW Task: check if index in array contains something selectedCategories, then change backgroud of cell
    
    
    
    
    
    return cell
    
  }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = categoriesArray[indexPath.row]
        if (selectedCategories.contains(category)){
            print("\(category) is in the array already..now removing")
            let selectedIndex = selectedCategories.index(of: category)
            selectedCategories.remove(at: selectedIndex!)
            print(selectedCategories)
            collectionView.reloadData()
        }
        else{
            print("\(category) is not in the array already..now adding")
            let selectedCategory = categoriesArray[indexPath.row]
            selectedCategories.append(selectedCategory)
            print(selectedCategories)
            collectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemsPerRow: CGFloat = 4
        let availableWidth = view.frame.width
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
        
      }
    
    
    @IBAction func categorySelected(_ sender: AnyObject) {
       self.performSegue(withIdentifier: "categoryToHomeFeedSegue", sender: nil)
        
        
        ICUserService.sharedInstance.savePreference()
        
        
    }
    
   
    
    
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
