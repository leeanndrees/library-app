//
//  ViewController.swift
//  library
//
//  Created by DetroitLabs on 9/4/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

import UIKit

class LibraryViewController: UITableViewController {
    
    var libraryItems: [LibraryItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return libraryItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryItem", for: indexPath)
        
        return cell
    }

    func swipeToDelete(indexPath: IndexPath) {
        libraryItems.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        swipeToDelete(indexPath: indexPath)
    }

}

