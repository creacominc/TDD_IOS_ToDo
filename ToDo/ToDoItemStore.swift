//
//  ToDoItemStore.swift
//  ToDo
//
//  Created by Harold Tomlinson on 2024-03-10.
//

import Foundation
import Combine

class ToDoItemStore 
{
    var itemPublisher = CurrentValueSubject<[ToDoItem], Never>([])

    private var items: [ToDoItem] = []
    {
        didSet {
            itemPublisher.send(items)
        }
    }

    func add(_ item: ToDoItem) 
    {
        items.append(item)
    }

}

