//
//  ViewController.swift
//  UsefulConcepts
//
//  Created by Suresh on 08/12/14.
//  Copyright (c) 2014 Neev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var elementsArray  : NSArray =  ["Suresh Kumar D", "Pramesh S", "Rajesh S", "Annamalairaj J", "Krishna Kumar Sharma", "Rajesh A E", "Radha Krishnan", "Allwin S", "Muruganandan K", "Natarajan R", "Sathik Basha P", "Hariharasudhan S", "Suresh Kumar V P", "Selvendiran P", "Manivasagan T", "Abishek R" ]
    var tableElements = []
    override func viewDidLoad() {
        super.viewDidLoad()
         self.title = "Search Bar Demo"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        tableElements = self.elementsArray as Array<String>
    }
    
    //MARK: - TableView Datasource Methods...
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.tableElements.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell? = self.tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath) as? UITableViewCell
        if(cell == nil) {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "CellIdentifier")
            
        }
        cell?.textLabel?.text = self.tableElements[indexPath.row] as? String
        return cell!
    }
    
    //MARK: - TableView Delegate Methods...
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("selected index \(indexPath.row)")
        var storyBoard = UIStoryboard(name: "Main", bundle: nil)
        var sampleTVC = storyBoard.instantiateViewControllerWithIdentifier("SampleTableViewController") as SampleTableViewController
        self.navigationController?.pushViewController(sampleTVC, animated: true)
    }
    
    //MARK: - Searchbar Delegate Method...
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        println("searchBar.text \(searchText)")
        if(searchText != "") {
            self.filterContentForSearchText(searchText, scope: searchBar.text)
        }
        else {
            self.viewWillAppear(true)
            self.tableView.reloadData()
            println("inside else part")
        }

    }


    func filterContentForSearchText(searchText : String , scope : String) {
        var predicate = NSPredicate(format: "SELF contains[cd] %@", searchText)
        self.tableElements = self.elementsArray.filteredArrayUsingPredicate(predicate!) as Array<String>
        
        self.tableView.reloadData()
        
        println(" self.tableView.frame.height \( self.tableView.frame.height)")
        self.tableView.contentSize  = CGSizeMake(self.tableView.frame.width, self.tableView.frame.height+265)

    }
    
   
}

