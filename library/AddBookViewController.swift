//
//  AddBookViewController.swift
//  library
//
//  Created by DetroitLabs on 9/5/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

import UIKit

class AddBookViewController: UITableViewController {
    @IBOutlet weak var userBookTitle: UITextField!
    @IBOutlet weak var userBookAuthor: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }

    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
  
    @IBAction func done() {
        navigationController?.popViewController(animated: true)
    }

}
