//
//  ToDoItem.swift
//  ToDo
//
//  Created by Harold Tomlinson on 2024-03-05.
//

import Foundation
struct ToDoItem: Equatable, Codable
{
    let id: UUID
    let title: String
    let itemDescription: String?
    let timestamp: TimeInterval?
    let location: Location?
    var done = false

    init(title: String,
         itemDescription: String? = nil,
         timestamp: TimeInterval? = nil,
         location: Location? = nil
    )
    {
        self.id = UUID()
        self.title = title
        self.itemDescription = itemDescription
        self.timestamp = timestamp
        self.location = location
    }

    /** @NOTE:  This method is not strictly needed since the members are all equitable.  */
    static func ==(lhs: ToDoItem, rhs: ToDoItem) -> Bool
    {
        return lhs.title == rhs.title
            && lhs.itemDescription == rhs.itemDescription
            && lhs.timestamp == rhs.timestamp
            && lhs.location == rhs.location
    }
}
