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
            loopForChild(testArray, assert: false)
        }
    }

    private func loopForChild(_ array: TestArray<Child>, assert: Bool = true, file: StaticString = #file, line: UInt = #line) {
        for index in range {
            let included = array.included[index]
            let excluded = array.excluded[index]

            let includedIndex = array.test.index(of: included)
            let excludedIndex = array.test.index(of: excluded)

            let includedContains = array.test.contains(included)
            let excludedContains = array.test.contains(excluded)

            guard assert else { continue }

            XCTAssertNotNil(includedIndex, file: file, line: line)
            XCTAssertEqual(includedIndex, index, file: file, line: line)
            XCTAssertEqual(includedIndex, array.test.index(where: { $0 === included }), file: file, line: line)

            XCTAssertNil(excludedIndex, file: file, line: line)

            XCTAssertTrue(includedContains, file: file, line: line)
            XCTAssertFalse(excludedContains, file: file, line: line)
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
            loopForControllerDelegate(testArray, assert: false)
        }
    }

    private func loopForControllerDelegate(_ array: TestArray<ControllerDelegate>, assert: Bool = true, file: StaticString = #file, line: UInt = #line) {
        for index in range {
            let included = array.included[index]
            let excluded = array.excluded[index]

            let includedIndex = array.test.index(of: included)
            let excludedIndex = array.test.index(of: excluded)

            let includedContains = array.test.contains(included)
            let excludedContains = array.test.contains(excluded)

            guard assert else { continue }

            XCTAssertNotNil(includedIndex, file: file, line: line)
            XCTAssertEqual(includedIndex, index, file: file, line: line)
            XCTAssertEqual(includedIndex, array.test.index(where: { $0 === included }), file: file, line: line)

            XCTAssertNil(excludedIndex, file: file, line: line)

            XCTAssertTrue(includedContains, file: file, line: line)
            XCTAssertFalse(excludedContains, file: file, line: line)
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
            loopForCoordinating(testArray, assert: false)
        }
    }

    private func loopForCoordinating(_ array: TestArray<Coordinating>, assert: Bool = true, file: StaticString = #file, line: UInt = #line) {
        for index in range {
            let included = array.included[index]
            let excluded = array.excluded[index]

            let includedIndex = array.test.index(of: included)
            let excludedIndex = array.test.index(of: excluded)

            let includedContains = array.test.contains(included)
            let excludedContains = array.test.contains(excluded)

            guard assert else { continue }

            XCTAssertNotNil(includedIndex, file: file, line: line)
            XCTAssertEqual(includedIndex, index, file: file, line: line)
            XCTAssertEqual(includedIndex, array.test.index(where: { $0 === included }), file: file, line: line)

            XCTAssertNil(excludedIndex, file: file, line: line)

            XCTAssertTrue(includedContains, file: file, line: line)
            XCTAssertFalse(excludedContains, file: file, line: line)
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
            loopForCoordinatorDelegate(testArray, assert: false)
        }
    }

    private func loopForCoordinatorDelegate(_ array: TestArray<CoordinatorDelegate>, assert: Bool = true, file: StaticString = #file, line: UInt = #line) {
        for index in range {
            let included = array.included[index]
            let excluded = array.excluded[index]

            let includedIndex = array.test.index(of: included)
            let excludedIndex = array.test.index(of: excluded)

            let includedContains = array.test.contains(included)
            let excludedContains = array.test.contains(excluded)

            guard assert else { continue }

            XCTAssertNotNil(includedIndex, file: file, line: line)
            XCTAssertEqual(includedIndex, index, file: file, line: line)
            XCTAssertEqual(includedIndex, array.test.index(where: { $0 === included }), file: file, line: line)

            XCTAssertNil(excludedIndex, file: file, line: line)

            XCTAssertTrue(includedContains, file: file, line: line)
            XCTAssertFalse(excludedContains, file: file, line: line)
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
            loopForNavigating(testArray, assert: false)
        }
    }

    private func loopForNavigating(_ array: TestArray<Navigating>, assert: Bool = true, file: StaticString = #file, line: UInt = #line) {
        for index in range {
            let included = array.included[index]
            let excluded = array.excluded[index]

            let includedIndex = array.test.index(of: included)
            let excludedIndex = array.test.index(of: excluded)

            let includedContains = array.test.contains(included)
            let excludedContains = array.test.contains(excluded)

            guard assert else { continue }

            XCTAssertNotNil(includedIndex, file: file, line: line)
            XCTAssertEqual(includedIndex, index, file: file, line: line)
            XCTAssertEqual(includedIndex, array.test.index(where: { $0 === included }), file: file, line: line)

            XCTAssertNil(excludedIndex, file: file, line: line)

            XCTAssertTrue(includedContains, file: file, line: line)
            XCTAssertFalse(excludedContains, file: file, line: line)
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
            loopForParent(testArray, assert: false)
        }
    }

    private func loopForParent(_ array: TestArray<Parent>, assert: Bool = true, file: StaticString = #file, line: UInt = #line) {
        for index in range {
            let included = array.included[index]
            let excluded = array.excluded[index]

            let includedIndex = array.test.index(of: included)
            let excludedIndex = array.test.index(of: excluded)

            let includedContains = array.test.contains(included)
            let excludedContains = array.test.contains(excluded)

            guard assert else { continue }

            XCTAssertNotNil(includedIndex, file: file, line: line)
            XCTAssertEqual(includedIndex, index, file: file, line: line)
            XCTAssertEqual(includedIndex, array.test.index(where: { $0 === included }), file: file, line: line)

            XCTAssertNil(excludedIndex, file: file, line: line)

            XCTAssertTrue(includedContains, file: file, line: line)
            XCTAssertFalse(excludedContains, file: file, line: line)
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
            loopForRootNavigating(testArray, assert: false)
        }
    }

    private func loopForRootNavigating(_ array: TestArray<RootNavigating>, assert: Bool = true, file: StaticString = #file, line: UInt = #line) {
        for index in range {
            let included = array.included[index]
            let excluded = array.excluded[index]

            let includedIndex = array.test.index(of: included)
            let excludedIndex = array.test.index(of: excluded)

            let includedContains = array.test.contains(included)
            let excludedContains = array.test.contains(excluded)

            guard assert else { continue }

            XCTAssertNotNil(includedIndex, file: file, line: line)
            XCTAssertEqual(includedIndex, index, file: file, line: line)
            XCTAssertEqual(includedIndex, array.test.index(where: { $0 === included }), file: file, line: line)

            XCTAssertNil(excludedIndex, file: file, line: line)

            XCTAssertTrue(includedContains, file: file, line: line)
            XCTAssertFalse(excludedContains, file: file, line: line)
        }
    }

    // sourcery:end
}
