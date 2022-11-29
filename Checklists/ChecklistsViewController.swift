//
//  ChecklistsViewController.swift
//  Checklists
//
//  Created by NAHØM on 27/11/2022.
//

import UIKit

protocol AddChecklistsViewControllerDelegate {
    func addChecklist() -> (String, UIImage)
    
}


class ChecklistsViewController: UITableViewController {
    
    @IBOutlet weak var mainNavTitle: UINavigationItem!
    

    var delegate: AddChecklistsViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("checklist viewdidload")
        navigationController?.navigationBar.prefersLargeTitles = true
        
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
        
        numberOfLists += 1
        tableView.reloadData()
        
    }
    
    func getCurrentListIndex() -> Int {
        return currentListIndex
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfLists
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
        currentListIndex = indexPath.row
        
//        let vc = storyboard?.instantiateViewController(withIdentifier: "items") as! ItemsViewController
//
//        vc.delegate = self
//        navigationController?.pushViewController(vc, animated: true)
        
        performSegue(withIdentifier: "itemsSegue", sender: nil)
    }
    
}
