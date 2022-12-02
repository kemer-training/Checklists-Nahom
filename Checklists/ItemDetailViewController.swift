//
//  ItemDetailViewController.swift
//  Checklists
//
//  Created by NAHØM on 27/11/2022.
//

import UIKit




class ItemDetailViewController: UITableViewController{
    
    
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var remindMeSwitch: UISwitch!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate: ChecklistViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTextField.becomeFirstResponder()
        loadChecklistItems()
    }
    
    
    func validateText() -> String?{
        var trimmedInput = (itemTextField.text?.components(separatedBy: " "))!
        trimmedInput = trimmedInput.filter { !($0.isEmpty) }
        
        let validText = trimmedInput.joined(separator: " ")
        if validText.isEmpty{
            return nil
        }
        return validText
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
    
        delegate?.addItem(text: itemTextField.text!, remindMe: remindMeSwitch.isOn, date: datePicker.date, at: currentListIndex)

        saveChecklistItems()
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}


