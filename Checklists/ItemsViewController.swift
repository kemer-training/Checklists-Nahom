//
//  ItemsViewController.swift
//  Checklists
//
//  Created by NAHØM on 27/11/2022.
//

import UIKit

//protocol ItemsViewControllerDelegate{
//
//}

class ItemsViewController: UITableViewController{
    var currentIndex = -1   // zero indexed
    var refactor_me = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addItem(text: "Walking My Dog", at: refactor_me)
        addItem(text: "Learning iOS Development", at: refactor_me)
        addItem(text: "Playing Guitar", at: refactor_me)
    }
    
    func addItem(text: String, at index: Int){
        let item = ItemData()
        item.text = text
        lists[index].items.append(item)
        currentIndex += 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentIndex+1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        
        cell.textLabel?.text = lists[refactor_me].items[indexPath.row].text
        configureCheckmark(for: cell, at: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cell = tableView.cellForRow(at: indexPath)
        
        lists[refactor_me].items[indexPath.row].checked.toggle()
        configureCheckmark(for: cell!, at: indexPath)
        
    }
    
    
    func configureCheckmark(for cell: UITableViewCell , at indexPath: IndexPath){
        if lists[refactor_me].items[indexPath.row].checked {
            cell.imageView?.image = UIImage(named: "Icon-20")
        }
        else {
            cell.imageView?.image = UIImage(named: "No Icon 1")
        }
    }
    
}

