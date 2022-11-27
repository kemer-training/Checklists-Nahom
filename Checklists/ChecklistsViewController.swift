//
//  ChecklistsViewController.swift
//  Checklists
//
//  Created by NAHØM on 27/11/2022.
//

import UIKit

protocol ChecklistsViewControllerDelegate {
    func addChecklist() -> (String, UIImage)
}

class ChecklistsViewController: UITableViewController {
    
    @IBOutlet weak var mainNavTitle: UINavigationItem!
    var numberOfRows = 0
    
    var delegate: ChecklistsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
//        addList(text: "To Do", icon: UIImage(named: "Inbox")!)
//        addList(text: "Birthdays", icon: UIImage(named: "Birthdays")!)
    }
    override func viewWillAppear(_ animated: Bool) {
        if let text = delegate?.addChecklist().0,
           let icon = delegate?.addChecklist().1 {
            addList(text: text, icon: icon)
            delegate = nil
        }
        
    }
    func addList(text: String, icon: UIImage){
        let list = ChecklistData()
        list.text = text
        list.icon = icon
        lists.append(list)
        
        numberOfRows += 1
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        for _ in lists {
            cell.textLabel?.text = lists[indexPath.row].text
            cell.imageView?.image = lists[indexPath.row].icon
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
