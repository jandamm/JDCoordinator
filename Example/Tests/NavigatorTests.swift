//
//  NavigatorTests.swift
//  JDCoordinator_Tests
//
//  Created by Jan Dammshäuser on 31.03.18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

@testable import JDCoordinator
import XCTest

class NavigatorTests: XCTestCase {
    var navigationController: UINavigationController!
    var coordinator: RootNavigating!

    override func setUp() {
        super.setUp()

        navigationController = UINavigationController()
        coordinator = AppCoordinator(with: UINavigationController())

        setViewControllersAndCheck()
    }

    override func tearDown() {
        navigationController = nil
        coordinator = nil

        super.tearDown()
    }

    private func setViewControllersAndCheck(file: StaticString = #file, line: UInt = #line) {
        func setViewControllers(to navigationController: UINavigationController) {
            let controller = (0...5).map { _ in UIViewController() }
            navigationController.setViewControllers(controller, animated: false)
        }
        setViewControllers(to: navigationController)
        setViewControllers(to: coordinator.navigationController)

        XCTAssertEqual(navigationController.viewControllers.count, coordinator.navigationController.viewControllers.count, file: file, line: line)
    }

    func testGeneratedNavigatorMethods() {
        let animated = false
        let count = 1
        let completion: (() -> Void)? = nil

        // sourcery:inline:NavigatorTests

        // MARK: - pushViewController

        coordinator.pushViewController(UIViewController(), animated: animated)
        navigationController.pushViewController(UIViewController(), animated: animated)

        XCTAssertEqual(navigationController.viewControllers.count, coordinator.navigationController.viewControllers.count)

        setViewControllersAndCheck()

        // MARK: - popViewController

        coordinator.popViewController(animated: animated)
        navigationController.popViewController(animated: animated)

        XCTAssertEqual(navigationController.viewControllers.count, coordinator.navigationController.viewControllers.count)

        setViewControllersAndCheck()

        // MARK: - popToViewController

        coordinator.popToViewController(coordinator.navigationController.viewControllers.last!, animated: animated)
        navigationController.popToViewController(navigationController.viewControllers.last!, animated: animated)

        XCTAssertEqual(navigationController.viewControllers.count, coordinator.navigationController.viewControllers.count)

        setViewControllersAndCheck()

        // MARK: - popToRootViewController

        coordinator.popToRootViewController(animated: animated)
        navigationController.popToRootViewController(animated: animated)

        XCTAssertEqual(navigationController.viewControllers.count, coordinator.navigationController.viewControllers.count)

        setViewControllersAndCheck()

        // MARK: - setViewControllers

        coordinator.setViewControllers(coordinator.navigationController.viewControllers, animated: animated)
        navigationController.setViewControllers(navigationController.viewControllers, animated: animated)

        XCTAssertEqual(navigationController.viewControllers.count, coordinator.navigationController.viewControllers.count)

        setViewControllersAndCheck()

        // MARK: - present

        coordinator.present(UIViewController(), animated: animated, completion: completion)
        navigationController.present(UIViewController(), animated: animated, completion: completion)

        XCTAssertEqual(navigationController.viewControllers.count, coordinator.navigationController.viewControllers.count)

        setViewControllersAndCheck()

        // MARK: - dismiss

        coordinator.dismiss(animated: animated, completion: completion)
        navigationController.dismiss(animated: animated, completion: completion)

        XCTAssertEqual(navigationController.viewControllers.count, coordinator.navigationController.viewControllers.count)

        setViewControllersAndCheck()

        // MARK: - setViewController

        coordinator.setViewController(UIViewController(), animated: animated)
        navigationController.setViewController(UIViewController(), animated: animated)

        XCTAssertEqual(navigationController.viewControllers.count, coordinator.navigationController.viewControllers.count)

        setViewControllersAndCheck()

        // MARK: - replaceViewController

        coordinator.replaceViewController(UIViewController(), withNew: UIViewController(), animated: animated)
        navigationController.replaceViewController(UIViewController(), withNew: UIViewController(), animated: animated)

        XCTAssertEqual(navigationController.viewControllers.count, coordinator.navigationController.viewControllers.count)

        setViewControllersAndCheck()

        // MARK: - replaceViewControllers

        coordinator.replaceViewControllers(coordinator.navigationController.viewControllers, withNew: UIViewController(), animated: animated)
        navigationController.replaceViewControllers(navigationController.viewControllers, withNew: UIViewController(), animated: animated)

        XCTAssertEqual(navigationController.viewControllers.count, coordinator.navigationController.viewControllers.count)

        setViewControllersAndCheck()

        // MARK: - replaceLastViewControllers

        coordinator.replaceLastViewControllers(count: count, withNew: UIViewController(), animated: animated)
        navigationController.replaceLastViewControllers(count: count, withNew: UIViewController(), animated: animated)

        XCTAssertEqual(navigationController.viewControllers.count, coordinator.navigationController.viewControllers.count)

        setViewControllersAndCheck()
        // sourcery:end
    }
}
