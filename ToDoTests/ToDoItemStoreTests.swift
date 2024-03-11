//
//  ToDoItemStoreTests.swift
//  ToDoTests
//
//  Created by Harold Tomlinson on 2024-03-10.
//

import XCTest
@testable import ToDo
import Combine

final class ToDoItemStoreTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
//
//    func test_add_shouldPublishChange() 
//    {
//        let sut = ToDoItemStore()
//        let publisherExpectation = expectation(
//            description: "Wait for publisher in \(#file)"
//        )
//        var receivedItems: [ToDoItem] = []
//        /**
//         First, we drop the first published value from itemPublisher using dropFirst(). We do this because a CurrentValueSubject publisher publishes the first current value as soon as we subscribe to it. But in the test, we only want to assert that the changes have been published.
//         */
//        /**
//         Next, we subscribe to the publisher using sink(receiveValue:). The published value is passed into the receivedValue parameter. You can't see the parameter name in the code because we are using the trailing closure syntax as it is common in iOS development. We store the received value into the receivedItems variable. At this point, the asynchronous code we waited for in the test is finished. We tell the test runner that we don't need to wait any further by calling fulfill() on the expectation.
//         */
//        let token = sut.itemPublisher
//                    .dropFirst()
//                    .sink { items in
//                        receivedItems = items
//                        publisherExpectation.fulfill()
//                    }
//        /**
//         The last two lines in this code are the execution of the method we want to test. We assume here that ToDoItemStore has an add(_:) method that allows us to add to-do items to the item store.
//         */
//        let toDoItem = ToDoItem(title: "Dummy")
//        sut.add(toDoItem)
//        wait(for: [publisherExpectation], timeout: 1)
//        token.cancel()
////        XCTAssertEqual(receivedItems.first?.title,
////                       toDoItem.title)
//        XCTAssertEqual(receivedItems, [toDoItem])
//    }
//

    func test_add_shouldPublishChange() throws 
    {
        let sut = ToDoItemStore()
        let toDoItem = ToDoItem(title: "Dummy")
        let receivedItems = try wait(for: sut.itemPublisher)
        {
            sut.add(toDoItem)
        }
        XCTAssertEqual(receivedItems, [toDoItem])
    }

}

extension XCTestCase
{
    func wait<T: Publisher>( for publisher: T,
                             afterChange change: () -> Void,
                             file: StaticString = #file,
                             line: UInt = #line
                            )
        throws -> T.Output where T.Failure == Never
    {
        let publisherExpectation = expectation(
            description: "Wait for publisher in \(#file)"
        )
        var result: T.Output?
        let token = publisher
            .dropFirst()
            .sink 
        {
            value in
            result = value
            publisherExpectation.fulfill()
        }
        change()
        wait(for: [publisherExpectation], timeout: 1)
        token.cancel()
//        let unwrappedResult = try XCTUnwrap(
//          result,
//          "Publisher did not publish any value"
//        )
//        return unwrappedResult

        let unwrappedResult = try XCTUnwrap(
          result,
          "Publisher did not publish any value",
          file: file,
          line: line
        )
        return unwrappedResult
    }
}

