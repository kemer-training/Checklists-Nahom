//
//  PickIconViewController.swift
//  Checklists
//
//  Created by NAHØM on 27/11/2022.
//

import UIKit

class PickIconViewController: UITableViewController, AddChecklistViewControllerDelegate{
    var choosenIcon = UIImage(named: "Folder")
    
    func assignIcon() -> UIImage {
        return choosenIcon!
    }
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        
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
