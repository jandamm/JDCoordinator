//
//  ReferencingTests.swift
//  JDCoordinator_Tests
//
//  Created by Jan Dammshäuser on 10.03.18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

@testable import JDCoordinator
import XCTest

class ReferencingTests: XCTestCase {
    var appCoordinator: JDAppCoordinator!
    weak var appNavigationController: UINavigationController?
    weak var parentCoordinator: JDParentCoordinator?
    weak var parentNavigationController: UINavigationController?
    weak var childCoordinator: JDCoordinator?
    weak var childNavigationController: UINavigationController?

    override func setUp() {
        super.setUp()

        appCoordinator = JDAppCoordinator(with: UINavigationController())
        appNavigationController = appCoordinator.navigationController
        parentCoordinator = JDParentCoordinator(with: appCoordinator.navigationController, andAddToParent: appCoordinator)
        parentNavigationController = parentCoordinator?.navigationController
        childCoordinator = JDCoordinator(with: UINavigationController(), andAddToParent: parentCoordinator!)
        childNavigationController = childCoordinator?.navigationController
    }

    override func tearDown() {
        appCoordinator = nil

        super.tearDown()
    }

    func testReferencing() {
        XCTAssertNotNil(appCoordinator)
        XCTAssertNotNil(appNavigationController)
        XCTAssertNotNil(parentCoordinator)
        XCTAssertNotNil(parentNavigationController)
        XCTAssertNotNil(childCoordinator)
        XCTAssertNotNil(childNavigationController)

        Assert.identical(appNavigationController, parentNavigationController)

        // Should deallocate childCoordinator and childNavigationController
        parentCoordinator?.removeChild(childCoordinator!)

        XCTAssertNil(childCoordinator)
        XCTAssertNil(childNavigationController)
        XCTAssertNotNil(parentCoordinator)

        // Should deallocate parentCoordinator but not parentNavigationController (=== appNavigationController)
        appCoordinator.removeChild(parentCoordinator!)

        XCTAssertNil(parentCoordinator)
        XCTAssertNotNil(parentNavigationController)

        // Should deallocate everything
        appCoordinator = nil

        XCTAssertNil(appCoordinator)
        XCTAssertNil(appNavigationController)
        XCTAssertNil(parentNavigationController)
    }
}

extension ReferencingTests {
    struct Assert: Asserting {
    }
}
