//
//  ControllerTests.swift
//  JDCoordinator_Tests
//
//  Created by Jan Dammshäuser on 11.03.18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

@testable import JDCoordinator
import XCTest

class ControllerTests: XCTestCase {
    var viewControllers: [UIViewController]!
    var navigationController: UINavigationController!
    let range = 0 ..< 5

    override func setUp() {
        super.setUp()

        navigationController = UINavigationController()
        viewControllers = range.map { _ in UIViewController() }
        navigationController.setViewControllers(viewControllers, animated: false)
    }

    override func tearDown() {
        navigationController = nil
        viewControllers = nil

        super.tearDown()
    }

    func testSetViewController() {
        let first = viewControllers.first!

        navigationController.setViewController(first, animated: false)

        XCTAssertEqual(navigationController.viewControllers.count, 1)
        XCTAssertEqual(navigationController.viewControllers, [first])
        XCTAssertTrue(navigationController.viewControllers.first === first)
    }

    func testReplaceViewController() {
        for i in range {
            // Remove viewController at any given index
            let new = UIViewController()
            let old = viewControllers.remove(at: i)

            navigationController.replaceViewController(old, withNew: new, animated: false)
            viewControllers.append(new) // old should be removed, new appended.

            XCTAssertFalse(navigationController.viewControllers.contains(old))
            XCTAssertEqual(navigationController.viewControllers.count, viewControllers.count)
            XCTAssertEqual(navigationController.viewControllers, viewControllers)
            XCTAssertTrue(navigationController.viewControllers.last === new)
        }

        // Append if to be replaced is not in navigationController
        let new = UIViewController()

        navigationController.replaceViewController(UIViewController(), withNew: new, animated: false)
        viewControllers.append(new) // old should be removed, new appended.

        XCTAssertEqual(navigationController.viewControllers.count, viewControllers.count)
        XCTAssertEqual(navigationController.viewControllers, viewControllers)
        XCTAssertTrue(navigationController.viewControllers.last === new)
    }

    //	func testReplaceViewControllers() {}
    //	func testReplaceLastViewControllers() {}
}

extension ControllerTests {
    struct Assert: Asserting {
    }
}
