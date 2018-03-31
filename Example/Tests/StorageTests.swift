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
    typealias Storage = ChildStorage.Storage

    var a: TestChild!
    var b: TestChild!
    var c: TestChild!

    override func setUp() {
        super.setUp()

        a = TestChild()
        b = TestChild()
        c = TestChild()
    }

    override func tearDown() {
        a = nil
        b = nil
        c = nil

        super.tearDown()
    }

    func testInitialization() {
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

    func testChildStorageMath() {
        let storageA: Storage = [a, b]
        let childStorageA: ChildStorage = [a, b]
        let storageB: Storage = [b, c]
        let childStorageB: ChildStorage = [b, c]

        Assert.identicalBehavior(storage: storageA, childStorage: childStorageA)
        Assert.identicalBehavior(storage: storageB, childStorage: childStorageB)

        XCTAssertEqual(storageA.contains(a), childStorageA.contains(a))
        XCTAssertEqual(storageA.contains(c), childStorageA.contains(c))

        do {
            let storage = storageA.union(storageB)
            let childStorage = childStorageA.union(childStorageB)
            Assert.identicalBehavior(storage: storage, childStorage: childStorage)
        }

        do {
            let storage = storageA.intersection(storageB)
            let childStorage = childStorageA.intersection(childStorageB)
            Assert.identicalBehavior(storage: storage, childStorage: childStorage)
        }

        do {
            let storage = storageA.subtracting([b, c])
            let childStorage = childStorageA.subtracting([b, c])
            Assert.identicalBehavior(storage: storage, childStorage: childStorage)
        }

        do {
            let storage = storageA.symmetricDifference(storageB)
            let childStorage = childStorageA.symmetricDifference(childStorageB)
            Assert.identicalBehavior(storage: storage, childStorage: childStorage)
        }
    }

    func testChildStorageMutation() {
        var storage = Storage()
        var childStorage = ChildStorage()

        Assert.identicalBehavior(storage: storage, childStorage: childStorage)

        do {
            let (aBool, aValue) = storage.insert(a)
            let (bBool, bValue) = childStorage.insert(a)
            XCTAssertEqual(aBool, bBool)
            XCTAssertEqual(aValue.anyHashable, bValue.anyHashable)
        }
        Assert.identicalBehavior(storage: storage, childStorage: childStorage)

        XCTAssertEqual(storage.update(with: a), childStorage.update(with: a)?.anyHashable)
        Assert.identicalBehavior(storage: storage, childStorage: childStorage)

        XCTAssertEqual(storage.update(with: b), childStorage.update(with: b)?.anyHashable)
        Assert.identicalBehavior(storage: storage, childStorage: childStorage)

        XCTAssertEqual(storage.remove(c), childStorage.remove(c)?.anyHashable)
        Assert.identicalBehavior(storage: storage, childStorage: childStorage)

        XCTAssertEqual(storage.remove(b), childStorage.remove(b)?.anyHashable)
        Assert.identicalBehavior(storage: storage, childStorage: childStorage)

        storage.formUnion([b, c])
        childStorage.formUnion([b, c])
        Assert.identicalBehavior(storage: storage, childStorage: childStorage)

        XCTAssertTrue(storage.contains(a))
        XCTAssertTrue(storage.contains(b))
        XCTAssertTrue(storage.contains(c))

        storage.formIntersection([b, c])
        childStorage.formIntersection([b, c])
        Assert.identicalBehavior(storage: storage, childStorage: childStorage)

        storage.formSymmetricDifference([a, b])
        childStorage.formSymmetricDifference([a, b])
        Assert.identicalBehavior(storage: storage, childStorage: childStorage)

        storage.removeAll()
        childStorage.removeAll()
        Assert.identicalBehavior(storage: storage, childStorage: childStorage)
    }
}

extension StorageTests {
    struct Assert: Asserting {
        static func identicalBehavior(storage: Storage, childStorage: ChildStorage, file: StaticString = #file, line: UInt = #line) {
            XCTAssertEqual(storage.isEmpty, childStorage.isEmpty, file: file, line: line)
            XCTAssertEqual(storage.startIndex, childStorage.startIndex, file: file, line: line)
            XCTAssertEqual(storage.endIndex, childStorage.endIndex, file: file, line: line)

            switch storage.count {
            case 0:
                return
            case 1: // StartIndex's object may be different, so it may fail > 1.
                XCTAssertEqual(storage[storage.startIndex], childStorage[childStorage.startIndex].anyHashable, file: file, line: line)
                fallthrough
            default:
                XCTAssertEqual(storage.index(after: storage.startIndex), childStorage.index(after: childStorage.startIndex), file: file, line: line)
                for object in childStorage {
                    XCTAssertTrue(storage.contains(object.anyHashable))
                }
            }
        }
    }
}

class TestChild: Child, Identifiable {
    let uuid = UUID()
    var parentCoordinator: Parent?
    func setParent(to _: Parent) {}
    func removed(fromParent _: Parent) {}
}
