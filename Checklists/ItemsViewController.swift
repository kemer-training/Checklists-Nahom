//
//  ItemsViewController.swift
//  Checklists
//
//  Created by NAHØM on 27/11/2022.
//

import UIKit


class ItemsViewController: UITableViewController {


    var delegate: AddItemViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let delegate = delegate?.getItem() else { return }
        
        addItem(text: delegate.0!, remindMe: delegate.1, date: delegate.2, at: currentListIndex)
        
        
        tableView.reloadData()
    }
    
    func addItem(text: String, remindMe: Bool, date: Date, at index: Int){
        let item = ItemData()
        item.text = text
        lists[index].items.append(item)
        lists[index].numberOfItems += 1
        lists[index].itemsRemaining += 1
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

    }
    
    func configureCheckmark(for cell: UITableViewCell , at indexPath: IndexPath){
        if lists[currentListIndex].items[indexPath.row].checked {
            cell.imageView?.image = UIImage(named: "Icon-20")
        }
        else {
            cell.imageView?.image = UIImage(named: "No Icon 1")
        }
    }
}

