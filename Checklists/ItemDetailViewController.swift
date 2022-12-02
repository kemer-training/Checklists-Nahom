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

    

//    func getItem() -> (String?, Bool, Date) {
//        return (validateText(), remindMeSwitch.isEnabled, datePicker.date)
//    }
    
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
        
//        let i = navigationController?.viewControllers.firstIndex(of: self)
//        let vc = navigationController?.viewControllers[i!-1] as! ChecklistViewController
        delegate?.addItem(text: itemTextField.text!, remindMe: remindMeSwitch.isOn, date: datePicker.date, at: currentListIndex)

//        vc.delegate = self
        saveChecklistItems()
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}


