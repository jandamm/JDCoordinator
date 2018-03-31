//
//  StorageTests.swift
//  JDCoordinator_Tests
//
//  Created by Jan Dammshäuser on 11.03.18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

@testable import JDCoordinator
import XCTest

class StorageTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInitialization() {
        let a = TestChild()
        let b = TestChild()
        let c = TestChild()

        let first = ChildStorage(arrayLiteral: a, b, c)
        let second = ChildStorage(elements: [a, b, c])
        let third = ChildStorage(storage: [a, b, c])

        XCTAssertTrue(first.contains(a))
        XCTAssertTrue(first.contains(b))
        XCTAssertTrue(first.contains(c))

        XCTAssertEqual(first, second)
        XCTAssertEqual(first, third)
        XCTAssertEqual(second, third)

        let empty = ChildStorage()
        XCTAssertTrue(empty.storage.isEmpty)
    }
}

extension StorageTests {
    struct Assert: Asserting {
    }
}

class TestChild: Child, Identifiable {
    let uuid = UUID()
    var parentCoordinator: Parent?
    func setParent(to _: Parent) {}
    func removed(fromParent _: Parent) {}
}
