//
//  ChecklistViewController.swift
//  Checklists
//
//  Created by NAHØM on 27/11/2022.
//

import UIKit

protocol ChecklistViewControllerDelegate {
    func addItem(text: String, remindMe: Bool, date: Date)
    func updateItem(at itemIndex: Int, text: String, remindMe: Bool, date: Date)
}

class ChecklistViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadChecklistItems()
    }
    
    @IBAction func addBtn(_ sender: UIBarButtonItem) {
        let itemDetailVC = storyboard?.instantiateViewController(withIdentifier: "itemDetail") as! ItemDetailViewController
        itemDetailVC.delegate = self
        
        navigationController?.pushViewController(itemDetailVC, animated: true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = lists[currentListIndex].text
        
        tableView.reloadData()
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists[currentListIndex].items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)

        cell.textLabel?.text = lists[currentListIndex].items[indexPath.row].text
        configureCheckmark(for: cell, at: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cell = tableView.cellForRow(at: indexPath)
        
        lists[currentListIndex].items[indexPath.row].checked.toggle()
        configureCheckmark(for: cell!, at: indexPath)
        
        saveChecklistItems()

    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let itemDetailVC = storyboard?.instantiateViewController(withIdentifier: "itemDetail") as! ItemDetailViewController
        
        itemDetailVC.delegate = self
        itemDetailVC.title = "Edit Item"
        itemDetailVC.itemText = (cell?.textLabel?.text)!
        itemDetailVC.editAtIndex = indexPath.row
        
        
        navigationController?.pushViewController(itemDetailVC, animated: true)
    }
    
    override func tableView(
      _ tableView: UITableView,
      commit editingStyle: UITableViewCell.EditingStyle,
      forRowAt indexPath: IndexPath
    ) {
        lists[currentListIndex].items.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        saveChecklistItems()
    }

    
    func configureCheckmark(for cell: UITableViewCell , at indexPath: IndexPath){
        if lists[currentListIndex].items[indexPath.row].checked {
            cell.imageView?.image = UIImage(named: "icon-checked")
            
        }
        else {
            cell.imageView?.image = UIImage(named: "icon-unchecked")
        }
    }
    
    

}

extension ChecklistViewController: ChecklistViewControllerDelegate{
    
    func addItem(text: String, remindMe: Bool, date: Date){
        let item = ItemData()
        item.text = text
        item.remindMe = remindMe
        item.date = date
        
        lists[currentListIndex].items.append(item)
        lists[currentListIndex].itemsRemaining += 1
        
        saveChecklistItems()
    }
    
    func updateItem(at itemIndex: Int, text: String, remindMe: Bool, date: Date) {
        let item = ItemData()
        item.text = text
        item.remindMe = remindMe
        item.date = date
        
        lists[currentListIndex].items[itemIndex] = item
        saveChecklistItems()
    }
    
}
