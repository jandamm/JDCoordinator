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
    var appCoordinator: JDAppCoordinator!
    var parentCoordinator: JDParentCoordinator!
    var coordinator: JDCoordinator!

    override func setUp() {
        super.setUp()
        navigationController = UINavigationController()
        appCoordinator = JDAppCoordinator(with: navigationController)
        parentCoordinator = JDParentCoordinator(with: navigationController, andAddToParent: appCoordinator)
        coordinator = JDCoordinator(withParent: parentCoordinator)
    }

    override func tearDown() {
        navigationController = nil
        appCoordinator = nil
        parentCoordinator = nil
        coordinator = nil
        super.tearDown()
    }

    func testStart() {
        // Just call start as it does nothing but counts to testcoverage
        appCoordinator.start()
        coordinator.start()
    }

    func testNavigationControllerSetup() {
        XCTAssertEqual(appCoordinator.navigationController, parentCoordinator.navigationController)
        XCTAssertEqual(appCoordinator.navigationController, coordinator.navigationController)
        XCTAssertEqual(parentCoordinator.navigationController, coordinator.navigationController)

        XCTAssertTrue(appCoordinator.navigationController === parentCoordinator.navigationController)
        XCTAssertTrue(appCoordinator.navigationController === coordinator.navigationController)
        XCTAssertTrue(parentCoordinator.navigationController === coordinator.navigationController)
    }

    func testParentChildSetup() {
        XCTAssertTrue(parentCoordinator.parentCoordinator === appCoordinator)
        XCTAssertTrue(appCoordinator.childCoordinators.contains(parentCoordinator))

        XCTAssertTrue(coordinator.parentCoordinator === parentCoordinator)
        XCTAssertTrue(parentCoordinator.childCoordinators.contains(coordinator))
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
        let coordParentChildStack = coordinator.parentChildStack
        XCTAssertTrue(coordParentChildStack.contains(parentCoordinator))
        XCTAssertTrue(coordParentChildStack.contains(coordinator))
        XCTAssertTrue(coordParentChildStack.first === coordinator)
        XCTAssertTrue(coordParentChildStack.last === parentCoordinator)
        XCTAssertEqual(coordParentChildStack.count, 2)

        let parentParentChildStack = parentCoordinator.parentChildStack
        XCTAssertEqual(parentParentChildStack.count, 1)
        XCTAssertTrue(parentParentChildStack.first === parentCoordinator)
    }

    func testAddChild() {
        let formerParent = coordinator.getFormerParent(parentIsNot: appCoordinator)

		// Adding child twice should not change anything
		(1...2).forEach { _ in
        	appCoordinator.addChild(coordinator)

        	childParentExpectations(with: formerParent)
		}
    }

    func testSetParent() {
        let formerParent = coordinator.getFormerParent(parentIsNot: appCoordinator)

		// Setting parent twice should not change anything
		(1...2).forEach { _ in
			coordinator.setParent(to: appCoordinator)

			childParentExpectations(with: formerParent)
		}
    }

    func childParentExpectations(with formerParent: JDParentCoordinating) {
        // Is now in corrects parent childCoordinators
        XCTAssertTrue(appCoordinator.childCoordinators.contains(coordinator))
        XCTAssertTrue(appCoordinator.hasChild(coordinator))
        XCTAssertTrue(!formerParent.hasChild(coordinator))

        // ParentCoordinator is set correctly
        XCTAssertTrue(coordinator.parentCoordinator === appCoordinator)
        XCTAssertEqual(coordinator.parentCoordinators.count, 1)
    }
}

private extension JDChildCoordinating {
    func getFormerParent(parentIsNot potentialParent: JDParentCoordinating) -> JDParentCoordinating {
        let formerParent = parentCoordinator!
        XCTAssertFalse(potentialParent === formerParent)
        return formerParent
    }
}
