//
//  AddItemViewController.swift
//  Checklists
//
//  Created by NAHØM on 27/11/2022.
//

import UIKit

protocol AddItemViewControllerDelegate {
    func getItem() -> (String?, Bool, Date)
}

class AddItemViewController: UITableViewController, AddItemViewControllerDelegate{
    
    
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var remindMeSwitch: UISwitch!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTextField.becomeFirstResponder()
        
    }

    func getItem() -> (String?, Bool, Date) {
        return (validateText(), remindMeSwitch.isEnabled, datePicker.date)
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
        
        let i = navigationController?.viewControllers.firstIndex(of: self)
        let vc = navigationController?.viewControllers[i!-1] as! ItemsViewController
        

        vc.delegate = self
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}
