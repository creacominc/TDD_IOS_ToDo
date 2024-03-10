//
//  Location.swift
//  ToDo
//
//  Created by Harold Tomlinson on 2024-03-09.
//

import Foundation
import CoreLocation

struct Location 
{
    let name: String
    let coordinate: CLLocationCoordinate2D?
    init(name: String,
         coordinate: CLLocationCoordinate2D? = nil)
    {
        self.name = name
        self.coordinate = coordinate
    }
}

extension Location: Equatable
{
    static func ==(lhs: Location, rhs: Location) -> Bool
    {
        return lhs.name == rhs.name
        && lhs.coordinate?.latitude == rhs.coordinate?.latitude
        && lhs.coordinate?.longitude == rhs.coordinate?.longitude
    }
}
