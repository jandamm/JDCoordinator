//
//  SequenceTests.swift
//  JDCoordinator_Tests
//
//  Created by Jan Dammshäuser on 30.03.18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

@testable import JDCoordinator
import XCTest

class SequenceTests: XCTestCase {
    let range = 0..<20

    typealias TestArray<T> = (test: [T], included: [T], excluded: [T])

    private func createCoordinators<T>(_: T.Type) -> TestArray<T> {
        let appCoordinator = AppCoordinator(with: UINavigationController())
        let mapper: (Int) -> T = { _ in ParentCoordinator(withParent: appCoordinator) as! T }

        let testArray = (0..<400).map(mapper)
        let included = Array(testArray[range])
        let excluded = range.map(mapper)
        return (testArray, included, excluded)
    }

    // sourcery:inline:SequenceTests

    // MARK: - Child generated tests

    func testChildExtension() {
        let testArray = createCoordinators(Child.self)
        loopForChild(testArray)
    }

    func testChildExtensionPerformance() {
        let testArray = createCoordinators(Child.self)
        measure {
            loopForChild(testArray)
        }
    }

    private func loopForChild(_ array: TestArray<Child>, file: StaticString = #file, line: UInt = #line) {
        for index in range {
            let included = array.included[index]
            let excluded = array.excluded[index]
            let includedIndex = array.test.index(of: included)
            let excludedIndex = array.test.index(of: excluded)

            XCTAssertNotNil(includedIndex, file: file, line: line)
            XCTAssertEqual(includedIndex, array.test.index(where: { $0 === included }), file: file, line: line)

            XCTAssertNil(excludedIndex, file: file, line: line)
            XCTAssertEqual(excludedIndex, array.test.index(where: { $0 === excluded }), file: file, line: line)

            XCTAssertTrue(array.test.contains(array.included[index]), file: file, line: line)
            XCTAssertFalse(array.test.contains(array.excluded[index]), file: file, line: line)
        }
    }

    // MARK: - ControllerDelegate generated tests

    func testControllerDelegateExtension() {
        let testArray = createCoordinators(ControllerDelegate.self)
        loopForControllerDelegate(testArray)
    }

    func testControllerDelegateExtensionPerformance() {
        let testArray = createCoordinators(ControllerDelegate.self)
        measure {
            loopForControllerDelegate(testArray)
        }
    }

    private func loopForControllerDelegate(_ array: TestArray<ControllerDelegate>, file: StaticString = #file, line: UInt = #line) {
        for index in range {
            let included = array.included[index]
            let excluded = array.excluded[index]
            let includedIndex = array.test.index(of: included)
            let excludedIndex = array.test.index(of: excluded)

            XCTAssertNotNil(includedIndex, file: file, line: line)
            XCTAssertEqual(includedIndex, array.test.index(where: { $0 === included }), file: file, line: line)

            XCTAssertNil(excludedIndex, file: file, line: line)
            XCTAssertEqual(excludedIndex, array.test.index(where: { $0 === excluded }), file: file, line: line)

            XCTAssertTrue(array.test.contains(array.included[index]), file: file, line: line)
            XCTAssertFalse(array.test.contains(array.excluded[index]), file: file, line: line)
        }
    }

    // MARK: - Coordinating generated tests

    func testCoordinatingExtension() {
        let testArray = createCoordinators(Coordinating.self)
        loopForCoordinating(testArray)
    }

    func testCoordinatingExtensionPerformance() {
        let testArray = createCoordinators(Coordinating.self)
        measure {
            loopForCoordinating(testArray)
        }
    }

    private func loopForCoordinating(_ array: TestArray<Coordinating>, file: StaticString = #file, line: UInt = #line) {
        for index in range {
            let included = array.included[index]
            let excluded = array.excluded[index]
            let includedIndex = array.test.index(of: included)
            let excludedIndex = array.test.index(of: excluded)

            XCTAssertNotNil(includedIndex, file: file, line: line)
            XCTAssertEqual(includedIndex, array.test.index(where: { $0 === included }), file: file, line: line)

            XCTAssertNil(excludedIndex, file: file, line: line)
            XCTAssertEqual(excludedIndex, array.test.index(where: { $0 === excluded }), file: file, line: line)

            XCTAssertTrue(array.test.contains(array.included[index]), file: file, line: line)
            XCTAssertFalse(array.test.contains(array.excluded[index]), file: file, line: line)
        }
    }

    // MARK: - CoordinatorDelegate generated tests

    func testCoordinatorDelegateExtension() {
        let testArray = createCoordinators(CoordinatorDelegate.self)
        loopForCoordinatorDelegate(testArray)
    }

    func testCoordinatorDelegateExtensionPerformance() {
        let testArray = createCoordinators(CoordinatorDelegate.self)
        measure {
            loopForCoordinatorDelegate(testArray)
        }
    }

    private func loopForCoordinatorDelegate(_ array: TestArray<CoordinatorDelegate>, file: StaticString = #file, line: UInt = #line) {
        for index in range {
            let included = array.included[index]
            let excluded = array.excluded[index]
            let includedIndex = array.test.index(of: included)
            let excludedIndex = array.test.index(of: excluded)

            XCTAssertNotNil(includedIndex, file: file, line: line)
            XCTAssertEqual(includedIndex, array.test.index(where: { $0 === included }), file: file, line: line)

            XCTAssertNil(excludedIndex, file: file, line: line)
            XCTAssertEqual(excludedIndex, array.test.index(where: { $0 === excluded }), file: file, line: line)

            XCTAssertTrue(array.test.contains(array.included[index]), file: file, line: line)
            XCTAssertFalse(array.test.contains(array.excluded[index]), file: file, line: line)
        }
    }

    // MARK: - Navigating generated tests

    func testNavigatingExtension() {
        let testArray = createCoordinators(Navigating.self)
        loopForNavigating(testArray)
    }

    func testNavigatingExtensionPerformance() {
        let testArray = createCoordinators(Navigating.self)
        measure {
            loopForNavigating(testArray)
        }
    }

    private func loopForNavigating(_ array: TestArray<Navigating>, file: StaticString = #file, line: UInt = #line) {
        for index in range {
            let included = array.included[index]
            let excluded = array.excluded[index]
            let includedIndex = array.test.index(of: included)
            let excludedIndex = array.test.index(of: excluded)

            XCTAssertNotNil(includedIndex, file: file, line: line)
            XCTAssertEqual(includedIndex, array.test.index(where: { $0 === included }), file: file, line: line)

            XCTAssertNil(excludedIndex, file: file, line: line)
            XCTAssertEqual(excludedIndex, array.test.index(where: { $0 === excluded }), file: file, line: line)

            XCTAssertTrue(array.test.contains(array.included[index]), file: file, line: line)
            XCTAssertFalse(array.test.contains(array.excluded[index]), file: file, line: line)
        }
    }

    // MARK: - Parent generated tests

    func testParentExtension() {
        let testArray = createCoordinators(Parent.self)
        loopForParent(testArray)
    }

    func testParentExtensionPerformance() {
        let testArray = createCoordinators(Parent.self)
        measure {
            loopForParent(testArray)
        }
    }

    private func loopForParent(_ array: TestArray<Parent>, file: StaticString = #file, line: UInt = #line) {
        for index in range {
            let included = array.included[index]
            let excluded = array.excluded[index]
            let includedIndex = array.test.index(of: included)
            let excludedIndex = array.test.index(of: excluded)

            XCTAssertNotNil(includedIndex, file: file, line: line)
            XCTAssertEqual(includedIndex, array.test.index(where: { $0 === included }), file: file, line: line)

            XCTAssertNil(excludedIndex, file: file, line: line)
            XCTAssertEqual(excludedIndex, array.test.index(where: { $0 === excluded }), file: file, line: line)

            XCTAssertTrue(array.test.contains(array.included[index]), file: file, line: line)
            XCTAssertFalse(array.test.contains(array.excluded[index]), file: file, line: line)
        }
    }

    // MARK: - RootNavigating generated tests

    func testRootNavigatingExtension() {
        let testArray = createCoordinators(RootNavigating.self)
        loopForRootNavigating(testArray)
    }

    func testRootNavigatingExtensionPerformance() {
        let testArray = createCoordinators(RootNavigating.self)
        measure {
            loopForRootNavigating(testArray)
        }
    }

    private func loopForRootNavigating(_ array: TestArray<RootNavigating>, file: StaticString = #file, line: UInt = #line) {
        for index in range {
            let included = array.included[index]
            let excluded = array.excluded[index]
            let includedIndex = array.test.index(of: included)
            let excludedIndex = array.test.index(of: excluded)

            XCTAssertNotNil(includedIndex, file: file, line: line)
            XCTAssertEqual(includedIndex, array.test.index(where: { $0 === included }), file: file, line: line)

            XCTAssertNil(excludedIndex, file: file, line: line)
            XCTAssertEqual(excludedIndex, array.test.index(where: { $0 === excluded }), file: file, line: line)

            XCTAssertTrue(array.test.contains(array.included[index]), file: file, line: line)
            XCTAssertFalse(array.test.contains(array.excluded[index]), file: file, line: line)
        }
    }

    // sourcery:end
}
