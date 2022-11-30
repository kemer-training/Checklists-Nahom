//
//  PickIconViewController.swift
//  Checklists
//
//  Created by NAHØM on 27/11/2022.
//

import UIKit


class PickIconViewController: UITableViewController, AddChecklistViewControllerDelegate{
    var choosenIcon = UIImage(named: "Folder")
    
    var iconsList = [
        "No Icon",
        "Appointments",
        "Birthdays",
        "Chores",
        "Drinks",
        "Folder",
        "Groceries",
        "Inbox",
        "Photos",
        "Trips"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    func assignIcon() -> UIImage {
        return choosenIcon!
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iconsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "iconCell", for: indexPath)
        
        cell.imageView?.image = UIImage(named: iconsList[indexPath.row])
        cell.textLabel?.text = iconsList[indexPath.row]
        
        cell.textLabel?.font = .systemFont(ofSize: 15)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let i = navigationController?.viewControllers.firstIndex(of: self)
        let vc = navigationController?.viewControllers[i!-1] as! AddChecklistViewController
        
        let cell = tableView.cellForRow(at: indexPath)
        choosenIcon = cell?.imageView?.image

        vc.delegate = self
        navigationController?.popViewController(animated: true)
    }
}
