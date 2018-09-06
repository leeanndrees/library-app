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
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
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
    
    func notDoneAlert() {
        let notDoneAlert = UIAlertController(title: "Not Done Yet", message: "Please add both a title and an author.", preferredStyle: .alert)
        let notDoneAlertAction = UIAlertAction(title: "OK I will!", style: .default, handler: nil)
        notDoneAlert.addAction(notDoneAlertAction)
        
        present(notDoneAlert, animated: true, completion: nil)
    }
    
    func areWeDone() {
        let item = LibraryItem()
        if userBookTitle.text != "" && userBookAuthor.text != "" {
            
            item.name = userBookTitle.text!
            item.author = userBookAuthor.text!
            
            delegate?.addBookViewController(self, didFinishAdding: item)
        }
        else if userBookAuthor.text == "" {
            notDoneAlert()
        }
        else if userBookTitle.text == "" {
            notDoneAlert()
        }
    }

    @IBAction func cancel() {
        delegate?.addBookViewControllerDidCancel(self)
    }
  
    @IBAction func done() {
        areWeDone()
    }

}
