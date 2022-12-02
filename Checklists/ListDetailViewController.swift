//
//  ListDetailViewController.swift
//  Checklists
//
//  Created by NAHØM on 27/11/2022.
//

import UIKit

protocol ListDetailViewControllerDelegate {
    func editList(at index: Int)
}

class ListDetailViewController: UITableViewController, ListDetailViewControllerDelegate {
    
    
    @IBOutlet weak var checklistTextField: UITextField!
    @IBOutlet weak var choosenIcon: UIImageView!
    var text = ""
    var icon: String = "Folder"
    
    var delegate: IconPickerViewControllerDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        checklistTextField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateIcon()
    }

    
    @IBAction func done(_ sender: UIBarButtonItem) {
        
        guard let validText = validateText() else {
            return
        }
        
        let i = navigationController?.viewControllers.firstIndex(of: self)
        let vc = navigationController?.viewControllers[i!-1] as! AllListsViewController
        
        text = validText
        addList(text: text, icon: icon)
        vc.delegate = self

        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    func updateIcon(){
        if let x = delegate?.assignIcon(){
            choosenIcon.image = UIImage(named: x)
            icon = x
        }
    }
    
    func addList(text: String, icon: String){
        let list = ChecklistData()
        list.text = text
        list.icon = icon
        lists.append(list)
        
        numberOfLists += 1
        saveChecklistItems()
        
    }
    
    
    func editList(at index: Int) {
//        navigationItem.title = "Edit Checklist"
//        checklistTextField.text = lists[index].text
//        choosenIcon.image = UIImage(named: lists[index].icon)
    }
    
    func validateText() -> String?{
        var trimmedInput = (checklistTextField.text?.components(separatedBy: " "))!
        trimmedInput = trimmedInput.filter { !($0.isEmpty) }
        
        let validText = trimmedInput.joined(separator: " ")
        
        if validText.isEmpty{
            return nil
        }
        return validText
    }
    
    

    
}

