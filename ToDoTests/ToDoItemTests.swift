//
//  ToDoItemTests.swift
//  ToDoTests
//
//  Created by Harold Tomlinson on 2024-03-05.
//

import XCTest
@testable import ToDo


final class ToDoItemTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // ToDoItemTests.swift
    func test_init_whenGivenTitle_setsTitle()
    {
        let item = ToDoItem( title: "Dummy",
                             itemDescription: "Dummy Description" )
        XCTAssertNotNil( item.title, "Dummy" )
        XCTAssertNotNil( item.itemDescription, "Dummy Description" )
    }
    
    func test_init_setsTimestamp() throws
    {
        let dummyTimestamp: TimeInterval = 42.0
        let item = ToDoItem( title: "Dummy",
                             timestamp: dummyTimestamp )
        let timestamp = try XCTUnwrap( item.timestamp )
        XCTAssertEqual( timestamp, dummyTimestamp,
                        accuracy: 0.000_001 )
    }
    
    func test_whenGivenLocation_setsLocation()
    {
        let dummyLocation = Location( name: "Dummy Name" )
        let item = ToDoItem( title: "Dummy Title",
                             location: dummyLocation )
        XCTAssertEqual( item.location?.name,
                        dummyLocation.name )
    }
}
