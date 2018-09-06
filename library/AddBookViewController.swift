//
//  AddBookViewController.swift
//  library
//
//  Created by DetroitLabs on 9/5/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

import UIKit

protocol AddBookViewControllerDelegate: class {
    
    func addBookViewControllerDidCancel(_ controller: AddBookViewController)
    
    func addBookViewController(_ controller: AddBookViewController, didFinishAdding item: LibraryItem)
}

class AddBookViewController: UITableViewController {
    
    weak var delegate: AddBookViewControllerDelegate?
    
    @IBOutlet weak var userBookTitle: UITextField!
    @IBOutlet weak var userBookAuthor: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userBookTitle.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }

    @IBAction func cancel() {
        delegate?.addBookViewControllerDidCancel(self)
    }
  
    @IBAction func done() {
        let item = LibraryItem()
        item.name = userBookTitle.text!
        
        delegate?.addBookViewController(self, didFinishAdding: item)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddBook" {
            let controller = segue.destination as! AddBookViewController
            controller.delegate = self as? AddBookViewControllerDelegate
        }
    }

}
