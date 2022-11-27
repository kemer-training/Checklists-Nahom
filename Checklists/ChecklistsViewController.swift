//
//  ChecklistsViewController.swift
//  Checklists
//
//  Created by NAHØM on 27/11/2022.
//

import UIKit

class ChecklistsViewController: UITableViewController {
    
    @IBOutlet weak var mainNavTitle: UINavigationItem!
    var numberOfRows = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addList(text: "To Do", icon: "Inbox")
        addList(text: "Birthdays", icon: "Birthdays")
    }
    
    func addList(text: String, icon: String){
        let list = ChecklistData()
        list.text = text
        list.icon = icon
        lists.append(list)
        numberOfRows += 1
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        for _ in lists {
            cell.textLabel?.text = lists[indexPath.row].text
            cell.imageView?.image = UIImage(named: lists[indexPath.row].icon)
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
