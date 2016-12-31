//
//  JDCoordinatorProtocol.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05.09.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

/// Use this protocol for weak pointers to delegates of JDCoordinators in ViewControllers.
@objc
public protocol JDCoordinatorViewControllerDelegate: NSObjectProtocol {
    @objc optional func presentedVC(_ vc: UIViewController, movedTo parent: UIViewController?)
}

/// Use this protocol for weak pointers to delegates of JDParentCoordinators in JDCoordinators.
public typealias JDCoordinatorCoordinatorDelegate = JDParentCoordinatorProtocol

/// Blueprint of JDCoordinators
@objc
public protocol JDCoordinatorProtocol: JDCoordinatorViewControllerDelegate {
    var navigationController: UINavigationController { get }
    var previousViewController: UIViewController? { get set }
    func setPreviousViewControllerToCurrent()
    func start()
}

/// Blueprint of JDParentCoordinators
@objc
public protocol JDParentCoordinatorProtocol: JDCoordinatorProtocol {
    var childCoordinators: [JDCoordinator] { get }
    func addChildCoordinator(_ coordinator: JDCoordinator)
    func removeChildCoordinator(_ coordinator: JDCoordinator)
    func removeAllChildCoordinator()
    func removeAllChildCoordinator(except coordinator: JDCoordinator)
}

/// Blueprint of JDSplitViewCoordinatorProtocol
@objc
public protocol JDSplitViewCoordinatorProtocol: JDParentCoordinatorProtocol {
    var splitViewPresenter: UIViewController { get }
    var splitViewController: JDSplitViewController { get }
    var masterCoordinator: JDCoordinator? { get }
    var masterNavigationController: UINavigationController! { get }
    var detailNavigationController: UINavigationController! { get }
}

extension JDSplitViewCoordinatorProtocol {
    
    public func removeAllDetailCoordinator() {
        guard let mc = masterCoordinator else {
            return removeAllChildCoordinator()
        }
        removeAllChildCoordinator(except: mc)
    }
}

public extension JDCoordinatorProtocol {
    
    /// Convenience method to pushViewController directly within JDCoordinator
    public func pushViewController(_ viewController: UIViewController, animated: Bool) {
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    /// Convenience method to popViewController directly within JDCoordinator
    @discardableResult public func popViewController(animated: Bool) -> UIViewController? {
        return navigationController.popViewController(animated: animated)
    }
    
    /// Convenience method to popToViewController directly within JDCoordinator
    @discardableResult public func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        return navigationController.popToViewController(viewController, animated: animated)
    }
    
    /// Convenience method to popToRootViewController directly within JDCoordinator
    @discardableResult public func popToRootViewController(animated: Bool) -> [UIViewController]? {
        return navigationController.popToRootViewController(animated: animated)
    }
    
    /// Convenience method to setViewControllers directly within JDCoordinator
    public func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        navigationController.setViewControllers(viewControllers, animated: animated)
    }
    
    /// Convenience method to setViewControllers directly within JDCoordinator with only one ViewController
    public func setViewControllers(_ viewController: UIViewController, animated: Bool) {
        navigationController.setViewControllers([viewController], animated: animated)
    }
    
    /// Convenience method to present directly within JDCoordinator
    public func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        navigationController.present(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    /// Convenience method to dismiss directly within JDCoordinator
    public func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        navigationController.dismiss(animated: flag, completion: completion)
    }
}
