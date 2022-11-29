//
//  ChecklistData.swift
//  Checklists
//
//  Created by NAHØM on 27/11/2022.
//

import UIKit

class ChecklistData{
    
    var text = ""
    var icon = UIImage(named: "Folder")
    var items: [ItemData] = []
    var numberOfItems = 0
}

class ItemData{
    var text = ""
    var checked = false
}

var lists: [ChecklistData] = []
var numberOfLists = 0
var currentListIndex = 0


