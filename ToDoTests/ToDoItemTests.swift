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
    func test_init_takesTitle() {
      ToDoItem(title: "Dummy")
    }

}
