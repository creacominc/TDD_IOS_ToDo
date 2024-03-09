//
//  ToDoItem.swift
//  ToDo
//
//  Created by Harold Tomlinson on 2024-03-05.
//

import Foundation
struct ToDoItem {
    
    let title: String
    let itemDescription: String?
    let timestamp: TimeInterval?
    let location: Location?
    
    init(title: String,
         itemDescription: String? = nil,
         timestamp: TimeInterval? = nil,
         location: Location? = nil
    )
    {
        self.title = title
        self.itemDescription = itemDescription
        self.timestamp = timestamp
        self.location = location
    }
    
}
