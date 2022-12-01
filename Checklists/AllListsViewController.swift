//
//  AllListsViewController.swift
//  Checklists
//
//  Created by NAHØM on 27/11/2022.
//

import UIKit

protocol ListDetailViewControllerDelegate {
    func addChecklist() -> (String, UIImage)
    
}


class AllListsViewController: UITableViewController {
    
    @IBOutlet weak var mainNavTitle: UINavigationItem!
    
    var itemsRemaining = 0
    var delegate: ListDetailViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let text = delegate?.addChecklist().0,
           let icon = delegate?.addChecklist().1 {
            addList(text: text, icon: icon)
            delegate = nil
        }
        
        
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
    
    func addList(text: String, icon: UIImage){
        let list = ChecklistData()
        list.text = text
        list.icon = icon
        lists.append(list)
        
        numberOfLists += 1
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfLists
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        
        
        cell.textLabel?.text = lists[indexPath.row].text
        
        cell.imageView?.image = lists[indexPath.row].icon
        
        if lists[indexPath.row].numberOfItems == 0{
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
