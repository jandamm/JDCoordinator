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
    var appCoordinator: AppCoordinator!
    weak var appNavigationController: UINavigationController?
    weak var parentCoordinator: ParentCoordinator?
    weak var parentNavigationController: UINavigationController?
    weak var childCoordinator: Coordinator?
    weak var childNavigationController: UINavigationController?

    override func setUp() {
        super.setUp()

        appCoordinator = AppCoordinator(with: UINavigationController())
        appNavigationController = appCoordinator.navigationController
        parentCoordinator = ParentCoordinator(with: appCoordinator.navigationController, andAddToParent: appCoordinator)
        parentNavigationController = parentCoordinator?.navigationController
        childCoordinator = Coordinator(with: UINavigationController(), andAddToParent: parentCoordinator!)
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
        wait(for: expectNil(at: "childNavigationController"), timeout: 0.2)
        XCTAssertNotNil(parentCoordinator)

        // Should deallocate parentCoordinator but not parentNavigationController (=== appNavigationController)
        appCoordinator.removeChild(parentCoordinator!)

        XCTAssertNil(parentCoordinator)
        XCTAssertNotNil(parentNavigationController)

        // Should deallocate everything
        appCoordinator = nil

        XCTAssertNil(appCoordinator)

        let expectations = [
            "appNavigationController",
            "parentNavigationController",
        ].map(expectNil)

        wait(for: expectations, timeout: 0.2)
    }
}

extension ReferencingTests {
    func expectNil(at keyPath: String) -> XCTKVOExpectation {
        return XCTKVOExpectation(keyPath: keyPath, object: self, expectedValue: nil)
    }

    func wait(for expectation: XCTestExpectation, timeout seconds: TimeInterval) {
        wait(for: [expectation], timeout: seconds)
    }

    struct Assert: Asserting {
    }
}
