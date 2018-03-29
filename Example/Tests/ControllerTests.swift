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

        reset()
    }

    private func reset() {
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
        // Remove viewController at any given index
        for i in range {
            let new = UIViewController()
            let old = viewControllers.remove(at: i)
            viewControllers.append(new) // old should be removed, new appended.

            navigationController.replaceViewController(old, withNew: new, animated: false)

            XCTAssertFalse(navigationController.viewControllers.contains(old))
            Assert.viewController(new, in: navigationController, supposedStack: viewControllers)
        }

        // Append if to be replaced is not in navigationController
        let new = UIViewController()
        viewControllers.append(new) // old should not be removed, new appended.

        navigationController.replaceViewController(UIViewController(), withNew: new, animated: false)

        Assert.viewController(new, in: navigationController, supposedStack: viewControllers)
    }

    func testReplaceViewControllers() {
        // Test range sizes from 0 to all.
        for i in range {
            let new = UIViewController()
            let r = 0 ... i
            let old = Array(viewControllers[r])
            viewControllers.removeSubrange(r)
            viewControllers.append(new)

            navigationController.replaceViewControllers(old, withNew: new, animated: false)

            Assert.viewController(new, in: navigationController, supposedStack: viewControllers)

            reset()
        }

        // Test not following viewControllers
        do {
            let new = UIViewController()
            var old: [UIViewController] = []

            old.append(viewControllers.remove(at: 2))
            old.append(viewControllers.remove(at: 3))
            viewControllers.append(new)

            navigationController.replaceViewControllers(old, withNew: new, animated: false)

            Assert.viewController(new, in: navigationController, supposedStack: viewControllers)
        }

        // Append if to be replaced is not in navigationController
        do {
            let new = UIViewController()

            viewControllers.append(new) // old should not be removed, new appended.

            navigationController.replaceViewController(UIViewController(), withNew: new, animated: false)

            Assert.viewController(new, in: navigationController, supposedStack: viewControllers)
        }
    }

    func testReplaceLastViewControllers() {
        // Test range sizes from 0 to all.
        for i in range {
            let new = UIViewController()

            viewControllers.removeLast(i)
            viewControllers.append(new)

            navigationController.replaceLastViewControllers(count: i, withNew: new, animated: false)

            Assert.viewController(new, in: navigationController, supposedStack: viewControllers)

            reset()
        }

        // Test negative count
        do {
            let new = UIViewController()
            let count = -1

            viewControllers.append(new) // should only append viewController

            navigationController.replaceLastViewControllers(count: count, withNew: new, animated: false)

            Assert.viewController(new, in: navigationController, supposedStack: viewControllers)

            reset()
        }

        // Test count > viewControllers
        do {
            let new = UIViewController()
            let count = viewControllers.count + 1

            viewControllers = [new] // should remove all viewControllers

            navigationController.replaceLastViewControllers(count: count, withNew: new, animated: false)

            Assert.viewController(new, in: navigationController, supposedStack: viewControllers)

            reset()
        }
    }

    func testRootNavigatingReplaceViewController() {
        let coordinator = TestCoordinator(navigationController: navigationController)
        let viewController = UIViewController()
        let keyPath: KeyPath<TestCoordinator, UIViewController?> = \.previousViewController

        XCTAssertNil(coordinator.previousViewController)
        XCTAssertEqual(coordinator.navigationController, navigationController)

        // Test keyPath => nil
        do {
            viewControllers.append(viewController) // should only append viewController

            coordinator.replaceViewController(keyPath, withNew: viewController, animated: false)

            Assert.viewController(viewController, in: navigationController, supposedStack: viewControllers)
        }

        // Test storePreviousViewController
        XCTAssertNil(coordinator.previousViewController)

        coordinator.storePreviousViewController()

        XCTAssertNotNil(coordinator.previousViewController)
        XCTAssertTrue(coordinator.previousViewController === coordinator.navigationController.viewControllers.last)
        XCTAssertTrue(coordinator.previousViewController === viewController)

        // Test keyPath => previousViewController
        do {
            let new = UIViewController()

            XCTAssertTrue(viewController === viewControllers.last)

            viewControllers.removeLast()
            viewControllers.append(new)

            coordinator.replaceViewController(keyPath, withNew: new, animated: false)

            Assert.viewController(new, in: navigationController, supposedStack: viewControllers)
        }
    }
}

extension ControllerTests {
    struct Assert: Asserting {
        static func viewController(_ viewController: UIViewController, in navigationController: UINavigationController, supposedStack: [UIViewController], file: StaticString = #file, line: UInt = #line) {
            XCTAssertEqual(navigationController.viewControllers.count, supposedStack.count, file: file, line: line)
            XCTAssertEqual(navigationController.viewControllers, supposedStack, file: file, line: line)
            XCTAssertTrue(navigationController.viewControllers.last === viewController, file: file, line: line)
        }
    }
}

class TestCoordinator: Navigating {
    var previousViewController: UIViewController?

    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
