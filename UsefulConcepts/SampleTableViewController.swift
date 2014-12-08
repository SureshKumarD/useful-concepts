//
//  SampleTableViewController.swift
//  UsefulConcepts
//
//  Created by Suresh on 08/12/14.
//  Copyright (c) 2014 Neev. All rights reserved.
//

import UIKit

class SampleTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var imagesArray = ["1.jpg", "2.png", "3.jpg", "4.jpg", "5.jpg"]
    override func viewDidLoad() {
        
    }
    
    override func didReceiveMemoryWarning() {
        
    }
    
    //MARK: - TableView Delegate Methods...
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.imagesArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell? = self.tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath) as? UITableViewCell
        if(cell == nil) {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "CellIdentifier")
            
        }
        let image = UIImage(named: self.imagesArray[indexPath.row])
        var imageView = UIImageView(image: image)
        imageView.frame = CGRectMake(0, 0, 320, 88.0)
        cell?.contentView.addSubview(imageView)
        return cell!
    }
    
    
    //MARK: - Searchbar Delegate Method...
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("selected index \(indexPath.row)")
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 88.0
    }
}
