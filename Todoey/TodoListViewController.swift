//
//  ViewController.swift
//  Todoey
//
//  Created by Funcraft on 03/01/2019.
//  Copyright © 2019 Funcraft. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["chicken","Book CNY", "Truffle"]
    
    let defaults = UserDefaults.standard
   // let defaults2 = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
            itemArray = items
        }
        // setting values to the Local user settings
//        defaults2.set(0.24, forKey: "Volume")
//        defaults2.set(true, forKey: "MusicOn")
//        defaults2.set(Date(), forKey: "AppLastOpenedByUser")
//        let array = [1,2,3]
//        defaults2.set(array, forKey: "myArray")
//        let dictionary = ["name": "Funcraft Admin", "email" : "funcraftye@gmail.com"]
//        defaults2.set(dictionary, forKey: "myDictionary")
    }

    //MARK - TableView Datasource Methods
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: <#T##IndexPath#>, animated: true)
        //itemArray[indexPath.row].completed = !itemArray[indexPath.row].completed
        print(String(itemArray[indexPath.row]))
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title:"Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen when user clicks Add Item
            print(textField.text)
            self.itemArray.append(textField.text!)
            // save in defaults
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            print("Success!")
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "New Items"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    

}

