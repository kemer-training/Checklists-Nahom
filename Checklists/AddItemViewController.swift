//
//  AddItemViewController.swift
//  Checklists
//
//  Created by NAHØM on 27/11/2022.
//

import UIKit

class AddItemViewController: UITableViewController{
    
    @IBOutlet weak var itemTextField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var remindMeSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func done(_ sender: UIBarButtonItem) {
    }
}
