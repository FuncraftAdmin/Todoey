//
//  ViewController.swift
//  Todoey
//
//  Created by Funcraft on 03/01/2019.
//  Copyright © 2019 Funcraft. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["chicken","Book CNY", "Truffle"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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

}

