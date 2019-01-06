//
//  ViewController.swift
//  Todoey
//
//  Created by Funcraft on 03/01/2019.
//  Copyright © 2019 Funcraft. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [TodoList]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let newitem = TodoList()
        newitem.title = "Update Cell Fund"
        itemArray.append(newitem)
 
        let newitem2 = TodoList()
        newitem2.title = "Get Wine for Christmas Dinner"
        itemArray.append(newitem2)
        
        let newitem3 = TodoList()
        newitem3.title = "CP eggs"
        itemArray.append(newitem3)
        
        if let items = defaults.array(forKey: "TodoListArray") as? [TodoList] {
                itemArray = items
        }

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
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        //Ternary operator
        // value = condition ? valueiftrue : valueif false
        
        cell.accessoryType = item.done ? .checkmark : .none
        
//        if item.done == true {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: <#T##IndexPath#>, animated: true)
        //itemArray[indexPath.row].completed = !itemArray[indexPath.row].completed
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title:"Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen when user clicks Add Item
            let newItem = TodoList()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            // save in defaults -- will not work here
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

