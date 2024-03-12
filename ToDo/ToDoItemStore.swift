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
    private let fileName: String
    
    var itemPublisher = CurrentValueSubject<[ToDoItem], Never>([])
    
    init(fileName: String = "todoitems")
    {
        self.fileName = fileName
        loadItems()
    }
    
    private var items: [ToDoItem] = []
    {
        didSet {
            itemPublisher.send(items)
        }
    }
    
    func add(_ item: ToDoItem)
    {
        print( "Items current size: \(items.count)" )
        print( "Adding item: \(item)" )
        items.append(item)
        saveItems()
    }
    
    func check( _ item: ToDoItem )
    {
        var mutableItem = item
        mutableItem.done = true
        if let index = items.firstIndex(of: item)
        {
            items[index] = mutableItem
            saveItems()
        }
    }

    //    private func saveItems()
    //    {
    //        print( "saveItems: \(fileName)" )
    //        if let url = FileManager.default
    //            .urls(for: .documentDirectory,
    //                  in: .userDomainMask)
    //                .first?
    //            .appendingPathComponent(fileName)
    //        {
    //            do
    //            {
    //                let data = try JSONEncoder().encode(items)
    //                try data.write(to: url)
    //            }
    //            catch
    //            {
    //                print("error: \(error)")
    //            }
    //        }
    //    }
    
    private func saveItems()
    {
        let url = FileManager.default
            .documentsURL(name: fileName)
        do
        {
            let data = try JSONEncoder().encode(items)
            try data.write(to: url)
        }
        catch
        {
            print("error: \(error)")
        }
    }
    
    //    private func loadItems()
    //    {
    //        if let url = FileManager.default
    //          .urls(for: .documentDirectory,
    //                   in: .userDomainMask)
    //          .first?
    //          .appendingPathComponent(fileName)
    //        {
    //            print( "loadItems from \(fileName)" )
    //            do
    //            {
    //                let data = try Data(contentsOf: url)
    //                print( "Data:  \(data)" )
    //                items = try JSONDecoder()
    //                        .decode([ToDoItem].self, from: data)
    //            }
    //            catch
    //            {
    //              print("error: \(error)")
    //            }
    //        }
    //    }
    
    
    private func loadItems()
    {
        let url = FileManager.default
            .documentsURL(name: fileName)
        do 
        {
            let data = try Data(contentsOf: url)
            items = try JSONDecoder()
                .decode([ToDoItem].self, from: data)
        }
        catch
        {
            print("error: \(error)")
        }
    }
    
    
    
}

