//
//  CoordinatorTests.swift
//  JDCoordinator_Tests
//
//  Created by Jan Dammshäuser on 10.03.18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

@testable import JDCoordinator
import XCTest

class CoordinatorTests: XCTestCase {
    var navigationController: UINavigationController!
    var appCoordinator: AppCoordinator!
    var parentCoordinator: ParentCoordinator!
    var coordinator: Coordinator!

    override func setUp() {
        super.setUp()
        navigationController = UINavigationController()
        appCoordinator = AppCoordinator(with: navigationController)
        parentCoordinator = ParentCoordinator(with: navigationController, andAddToParent: appCoordinator)
        coordinator = Coordinator(withParent: parentCoordinator)
    }

    override func tearDown() {
        navigationController = nil
        appCoordinator = nil
        parentCoordinator = nil
        coordinator = nil
        super.tearDown()
    }

    func testStart() {
        Assert.notStarted(appCoordinator)
        Assert.notStarted(coordinator)

        appCoordinator.start()
        coordinator.start()

        Assert.started(appCoordinator, times: 1)
        Assert.started(coordinator, times: 1)

        coordinator.start()

        Assert.started(coordinator, times: 2)
    }

    func testNavigationControllerSetup() {
        Assert.identical(appCoordinator.navigationController, parentCoordinator.navigationController)
        Assert.identical(appCoordinator.navigationController, coordinator.navigationController)
        Assert.identical(coordinator.navigationController, parentCoordinator.navigationController)
    }

    func testParentChildSetup() {
        XCTAssertTrue(parentCoordinator.parentCoordinator === appCoordinator)
        XCTAssertTrue(appCoordinator.childCoordinators.contains(parentCoordinator))
        XCTAssertTrue(appCoordinator.hasChild(parentCoordinator))

        XCTAssertTrue(coordinator.parentCoordinator === parentCoordinator)
        XCTAssertTrue(parentCoordinator.childCoordinators.contains(coordinator))
        XCTAssertTrue(parentCoordinator.hasChild(coordinator))
    }

    func testParentCoordinators() {
        let coordParents = coordinator.parentCoordinators
        XCTAssertTrue(coordParents.contains(parentCoordinator))
        XCTAssertTrue(coordParents.contains(appCoordinator))

        XCTAssertTrue(coordParents.first === parentCoordinator)
        XCTAssertTrue(coordParents.last === appCoordinator)
        XCTAssertEqual(coordParents.count, 2)

        let parentParents = parentCoordinator.parentCoordinators
        XCTAssertTrue(parentParents.contains(appCoordinator))

        XCTAssertTrue(parentParents.first === appCoordinator)
        XCTAssertEqual(parentParents.count, 1)
    }

    func testParentChildStack() {
        let coordinatorChildTree = coordinator.childTree
        XCTAssertTrue(coordinatorChildTree.contains(parentCoordinator))
        XCTAssertTrue(coordinatorChildTree.contains(coordinator))
        XCTAssertTrue(coordinatorChildTree.first === coordinator)
        XCTAssertTrue(coordinatorChildTree.last === parentCoordinator)
        XCTAssertEqual(coordinatorChildTree.count, 2)

        let parentChildTree = parentCoordinator.childTree
        XCTAssertEqual(parentChildTree.count, 1)
        XCTAssertTrue(parentChildTree.first === parentCoordinator)
    }

    func testAddChild() {
        var formerParent = coordinator.getFormerParent(parentIsNot: appCoordinator)

        // Adding child twice should not change anything
        (1 ... 2).forEach { _ in
            appCoordinator.addChild(coordinator)

            Assert.coordinator(coordinator, isChildOf: appCoordinator, not: formerParent, parentCount: 1)
        }

        formerParent = coordinator.getFormerParent(parentIsNot: parentCoordinator)

        Assert.notStarted(coordinator)

        parentCoordinator.addChildAndStart(coordinator)

        Assert.coordinator(coordinator, isChildOf: parentCoordinator, not: formerParent, parentCount: 2)
        Assert.started(coordinator, times: 1)
    }

    func testSetParent() {
        let formerParent = coordinator.getFormerParent(parentIsNot: appCoordinator)

        // Setting parent twice should not change anything
        (1 ... 2).forEach { _ in
            coordinator.setParent(to: appCoordinator)

            Assert.coordinator(coordinator, isChildOf: appCoordinator, not: formerParent, parentCount: 1)
        }
    }

//    func testRemoveChild() {
//        XCTFail("not implemented yet")
//    }
}

extension CoordinatorTests {
    struct Assert: Asserting {
        static func started(_ startable: StartTestable, file: StaticString = #file, line: UInt = #line) {
            XCTAssertTrue(startable.isStarted, file: file, line: line)
        }

        static func started(_ startable: StartTestable, times count: Int, file: StaticString = #file, line: UInt = #line) {
            started(startable, file: file, line: line)
            XCTAssertEqual(startable.startedCount, count, file: file, line: line)
        }

        static func notStarted(_ startable: StartTestable, file: StaticString = #file, line: UInt = #line) {
            XCTAssertFalse(startable.isStarted, file: file, line: line)
            XCTAssertEqual(startable.startedCount, 0, file: file, line: line)
        }

        static func coordinator(_ coordinator: ChildCoordinating, isChildOf parent: MutableParent, not formerParent: Parent, parentCount count: Int, file: StaticString = #file, line: UInt = #line) {
            // Is now in corrects parent childCoordinators
            XCTAssertTrue(parent.childCoordinators.contains(coordinator), file: file, line: line)
            XCTAssertTrue(parent.hasChild(coordinator), file: file, line: line)
            XCTAssertFalse(formerParent.hasChild(coordinator), file: file, line: line)

            // ParentCoordinator is set correctly
            XCTAssertTrue(coordinator.parentCoordinator === parent, file: file, line: line)
            XCTAssertEqual(coordinator.parentCoordinators.count, count, file: file, line: line)
        }
    }
}

private extension Child {
    func getFormerParent(parentIsNot potentialParent: Parent) -> Parent {
        let formerParent = parentCoordinator!
        XCTAssertTrue(potentialParent !== formerParent)
        return formerParent
    }
}
