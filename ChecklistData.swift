//
//  ChecklistData.swift
//  Checklists
//
//  Created by NAHØM on 27/11/2022.
//

import Foundation

class ChecklistData{
    var text = ""
    var icon = ""
    var items: [ItemData] = []
}

class ItemData{
    var text = ""
    var checked = false
}

var lists: [ChecklistData] = []
