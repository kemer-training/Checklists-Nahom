//
//  ListDetailViewController.swift
//  Checklists
//
//  Created by NAHØM on 27/11/2022.
//

import UIKit


protocol ListDetailViewControllerDelegate{
    func assignIcon(with icon: String)
}

class ListDetailViewController: UITableViewController {
    
    
    @IBOutlet weak var checklistTextField: UITextField!
    @IBOutlet weak var choosenIcon: UIImageView!
    var text = ""
    var icon: String = "Appointments"
    var editAtIndex: Int?
    
    var delegate: AllListsViewControllerDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        checklistTextField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if editAtIndex != nil{
            checklistTextField.text = text
            choosenIcon.image = UIImage(named: icon)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let pickIconVC = storyboard?.instantiateViewController(withIdentifier: "pickIcon") as! PickIconViewController
        
        pickIconVC.delegate = self
        navigationController?.pushViewController(pickIconVC, animated: true)
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        
        guard let validText = validateText() else {
            return
        }
        
        text = validText
        
        if let index = editAtIndex{
            delegate?.updateList(at: index, with: checklistTextField.text!, and: icon)
        }
        else{
            delegate?.addList(text: text, icon: icon)
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
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

extension ListDetailViewController: ListDetailViewControllerDelegate{
    func assignIcon(with icon: String) {
        self.icon = icon
        choosenIcon.image = UIImage(named: icon)
    }

}
