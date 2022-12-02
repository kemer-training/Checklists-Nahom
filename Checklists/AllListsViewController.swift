//
//  AllListsViewController.swift
//  Checklists
//
//  Created by NAHØM on 27/11/2022.
//

import UIKit


class AllListsViewController: UITableViewController {
    
    @IBOutlet weak var mainNavTitle: UINavigationItem!
    
    var itemsRemaining = 0
    var delegate: ListDetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadChecklistItems()
        
        if !lists.isEmpty{
            var uncheckedItems = 0
            for item in lists[currentListIndex].items{
                if !item.checked{
                    uncheckedItems += 1
                }
            }
            lists[currentListIndex].itemsRemaining = uncheckedItems
        }
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        lists.remove(at: indexPath.row)
        
        tableView.deleteRows(at: [indexPath], with: .automatic)
        saveChecklistItems()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        
        
        cell.textLabel?.text = lists[indexPath.row].text
        cell.imageView?.image = UIImage(named: lists[indexPath.row].icon)
        
        if lists[indexPath.row].items.count == 0{
            cell.detailTextLabel?.text = "(No items)"
        }
        else if lists[indexPath.row].itemsRemaining == 0 {
            cell.detailTextLabel?.text = "All Done"
        }
        else {
            cell.detailTextLabel?.text = "\(lists[indexPath.row].itemsRemaining) remaining"
        }

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        currentListIndex = indexPath.row
        
        performSegue(withIdentifier: "itemsSegue", sender: nil)
    }
    
}
