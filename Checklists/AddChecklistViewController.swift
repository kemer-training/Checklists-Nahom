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

class AddChecklistViewController: UITableViewController, ChecklistsViewControllerDelegate {
    
    
    
    @IBOutlet weak var checklistTextField: UITextField!
    @IBOutlet weak var choosenIcon: UIImageView!
    var text = ""
    var icon: UIImage = UIImage()
    
    var delegate: AddChecklistViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checklistTextField.becomeFirstResponder()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateIcon()
    }
    
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        
        guard let validText = validateText() else { return }
        
        let i = navigationController?.viewControllers.firstIndex(of: self)
        let vc = navigationController?.viewControllers[i!-1] as! ChecklistsViewController
        
        text = validText
        icon = choosenIcon.image!

        vc.delegate = self

        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    
    func updateIcon(){
        if let x = delegate?.assignIcon(){
            choosenIcon.image = x
        }
    }
    
    func addChecklist() -> (String, UIImage) {
        return (text, icon)
    }
    
    func validateText() -> String?{
        var trimmedInput = (checklistTextField.text?.components(separatedBy: " "))!
        trimmedInput = trimmedInput.filter { !($0.isEmpty) }
        
        var validText = trimmedInput.joined(separator: " ")
        if validText.isEmpty{
            return nil
        }
        return validText
    }
    
    
}

