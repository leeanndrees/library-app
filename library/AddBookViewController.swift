//
//  AddBookViewController.swift
//  library
//
//  Created by DetroitLabs on 9/5/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

import UIKit

class AddBookViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
  
    @IBAction func done() {
        navigationController?.popViewController(animated: true)
    }

}
