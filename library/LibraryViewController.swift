//
//  ViewController.swift
//  library
//
//  Created by DetroitLabs on 9/4/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

/*
 Build an app that lists the books in a library, including title and author (or the records in a collection, including title and artist, or anything else you like — as long as there are 2 pieces of related data)
 Your app should utilize Model-View-Controller architecture
 On the main page, your app should list each item in a table view
 The user should be able to swipe to delete items
 Your app should have a button which allows the user to add items to the list
 When your user goes to the Add page, the text field to enter a new item should automatically get focus
 */

import UIKit

class LibraryViewController: UITableViewController, AddBookViewControllerDelegate {
    func addBookViewControllerDidCancel(_ controller: AddBookViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addBookViewController(_ controller: AddBookViewController, didFinishAdding item: LibraryItem) {
        let newRowIndex = libraryItems.count
        libraryItems.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        navigationController?.popViewController(animated: true)
    }
    
    
    var libraryItems: [LibraryItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayLibraryItems()
        navigationController?.navigationBar.prefersLargeTitles = true
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
        cell.textLabel?.text = "\(libraryItems[indexPath.row].name), by \(libraryItems[indexPath.row].author)"
        
        return cell
    }

    func swipeToDelete(indexPath: IndexPath) {
        libraryItems.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        swipeToDelete(indexPath: indexPath)
    }
    
    func displayLibraryItems() {
        let booksAndAuthors = [
            "Harry Potter": "J.K. Rowling",
            "Children of Blood and Bone": "Tomi Adeyumi"
        ]
        
        for item in booksAndAuthors {
            let book = LibraryItem()
            book.name = String(item.key)
            book.author = String(item.value)
            libraryItems.append(book)
        }
    }
    
    @IBAction func addItem(_ sender: Any) {
        let newRowIndex = libraryItems.count
        
        let newItem = LibraryItem()
        newItem.name = "I am new!"
        newItem.author = "Someone new!"
        libraryItems.append(newItem)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    

}

