//
//  AddItemViewController.swift
//  Checklists
//
//  Created by NAHØM on 27/11/2022.
//

import UIKit



class AddItemViewController: UITableViewController{
    
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var remindMeSwitch: UISwitch!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}
