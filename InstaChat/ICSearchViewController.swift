//
//  ICSearchViewController.swift
//  InstaChat
//
//  Created by Benjamin Tan on 1/8/17.
//  Copyright © 2017 TheAustinSpace. All rights reserved.
//

import UIKit

class ICSearchViewController: UIViewController, ICSearchViewDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchResultTableView: UITableView!
    var searchResultsArray:[Venue] = []
    
    weak var searchDelegate:ICSearchViewDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchResultTableView.delegate = self
        searchDelegate = self
        searchResultTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTableView(_ text: String) {
        //Call service for loading in search results
        ICVenueService.sharedInstance.loadInDataWithVenueName(text) { (error, isCompleted, searchResultsArray) in
            if (error == nil && isCompleted == true) {
                self.searchResultsArray.removeAll()
                self.searchResultsArray = searchResultsArray
                self.searchResultTableView.reloadData()
            }
        }
    }
}

protocol ICSearchViewDelegate: class {
    func updateTableView(_ text: String)
}

extension ICSearchViewController: UISearchBarDelegate{
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        self.searchDelegate?.updateTableView(searchText)
    }
}

extension ICSearchViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = searchResultsArray[indexPath.row].name
        return cell
    }
}
