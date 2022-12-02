//
//  DataModel.swift
//  Checklists
//
//  Created by NAHØM on 02/12/2022.
//

import Foundation


func documentsDirectory() -> URL {
  let paths = FileManager.default.urls(
    for: .documentDirectory,
    in: .userDomainMask)
  return paths[0]
}

func dataFilePath() -> URL {
  return documentsDirectory().appendingPathComponent("Checklists.plist")
}

func saveChecklistItems() {
    let encoder = PropertyListEncoder()
    do {
        let data = try encoder.encode(lists)
        try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
    }
    catch {
      print("Error encoding item array: \(error.localizedDescription)")
    }
}

func loadChecklistItems() {
    let path = dataFilePath()
    if let data = try? Data(contentsOf: path) {
        let decoder = PropertyListDecoder()
        do {
            lists = try decoder.decode([ChecklistData].self,from: data)
            numberOfLists = lists.count
        }
        catch {
        print("Error decoding item array: \(error.localizedDescription)")
        }
    }
}
