//
//  FileManagerExtension.swift
//  ToDo
//
//  Created by Harold Tomlinson on 2024-03-11.
//

import Foundation

extension FileManager 
{
    func documentsURL(name: String) -> URL
    {
        guard let documentsURL = urls(for:
                .documentDirectory,
                                      in: .userDomainMask).first
        else
        {
            fatalError()
        }
        return documentsURL.appendingPathComponent(name)
    }
}

