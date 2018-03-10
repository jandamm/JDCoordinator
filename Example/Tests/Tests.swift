@testable import JDCoordinator
import UIKit
import XCTest

class Tests: XCTestCase {
    var appCoordinator: JDAppCoordinator!
    weak var appNavigationController: UINavigationController?
    weak var parentCoordinator: JDParentCoordinator?
    weak var parentNavigationController: UINavigationController?
    weak var childCoordinator: JDCoordinator?
    weak var childNavigationController: UINavigationController?

    override func setUp() {
        super.setUp()

        appCoordinator = JDAppCoordinator(with: createNavigationController())
        appNavigationController = appCoordinator.navigationController
        parentCoordinator = JDParentCoordinator(with: appCoordinator.navigationController, andAddToParent: appCoordinator)
        parentNavigationController = parentCoordinator?.navigationController
        childCoordinator = JDCoordinator(with: createNavigationController(), andAddToParent: parentCoordinator!)
        childNavigationController = childCoordinator?.navigationController
    }

    override func tearDown() {
        appCoordinator = nil
        super.tearDown()
    }

    func testRemoveChildAndReferencing() {
        XCTAssertNotNil(appCoordinator)
        XCTAssertNotNil(appNavigationController)
        XCTAssertNotNil(parentCoordinator)
        XCTAssertNotNil(parentNavigationController)
        XCTAssertNotNil(childCoordinator)
        XCTAssertNotNil(childNavigationController)

        XCTAssertEqual(appNavigationController, parentNavigationController)

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

private func createNavigationController() -> UINavigationController {
    return UINavigationController()
}
