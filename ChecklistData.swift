//
//  ChecklistData.swift
//  Checklists
//
//  Created by NAHØM on 27/11/2022.
//

import UIKit

class ChecklistData: Codable{
    
    var text = ""
    var icon = "Folder"
    var items: [ItemData] = []
    var itemsRemaining = 0
}

class ItemData: Codable{
    var text = ""
    var checked = false
    var remindMe = true
    var date = Date()
}

var lists: [ChecklistData] = []
var currentListIndex = 0


