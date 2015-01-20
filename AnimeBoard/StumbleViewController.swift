//
//  StumbleTableTableViewController.swift
//  AnimeBoard
//
//  Created by Jonathan Green on 1/19/15.
//  Copyright (c) 2015 Jonathan Green. All rights reserved.
//

import UIKit


 class StumbleViewController: UIViewController {
    
    @IBOutlet var StumView: UIView!
    
    var ran = Int(arc4random_uniform(20000)+1)
    
    var stumbleAnime:[Stum] = []
    
    @IBOutlet var StumbleTable: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        apiAuth(StumbleTable,ran)
        StumbleTable.reloadData()
        println(stumbleAnime)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
}
