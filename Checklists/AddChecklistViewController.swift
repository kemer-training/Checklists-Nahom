//
//  AddChecklistViewController.swift
//  Checklists
//
//  Created by NAHØM on 27/11/2022.
//

import UIKit

protocol AddChecklistViewControllerDelegate{
    func assignIcon() -> UIImage
}

class AddChecklistViewController: UITableViewController {
    
    @IBOutlet weak var choosenIcon: UIImageView!
    @IBOutlet weak var checklistTextField: UITextField!
    var icon = "Folder"
    
    var delegate: AddChecklistViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checklistTextField.becomeFirstResponder()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateIcon()
    }
    
    func updateIcon(){
        if let x = delegate?.assignIcon(){
            choosenIcon.image = x
            
        }
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
}

