//
//  UINavigationController.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 23.01.2017.
//  Copyright © 2017 Jan Dammshäuser. All rights reserved.
//

import Foundation

// MARK: - Default Methods
public extension UIViewController {

    /// Convenience method that will call equally named method with animated: true
    func present(_ viewControllerToPresent: UIViewController, completion: (() -> Void)? = nil) {
        present(viewControllerToPresent, animated: true, completion: completion)
    }

    /// Convenience method that will call equally named method with animated: true
    func dismiss(completion: (() -> Void)? = nil) {
        dismiss(animated: true, completion: completion)
    }
}

public extension UINavigationController {

    /// Convenience method that will call equally named method with animated: true
    func pushViewController(_ viewController: UIViewController) {
        pushViewController(viewController, animated: true)
    }

    /// Convenience method that will call equally named method with animated: true
    @discardableResult func popViewController() -> UIViewController? {
        return popViewController(animated: true)
    }

    /// Convenience method that will call equally named method with animated: true
    @discardableResult func popToViewController(_ viewController: UIViewController) -> [UIViewController]? {
        return popToViewController(viewController, animated: true)
    }

    /// Convenience method that will call equally named method with animated: true
    @discardableResult func popToRootViewController() -> [UIViewController]? {
        return popToRootViewController(animated: true)
    }

    /// Convenience method that will call equally named method with animated: true
    @nonobjc func setViewControllers(_ viewControllers: [UIViewController]) {
        setViewControllers(viewControllers, animated: true)
    }

    /// Convenience method that will call equally named method with animated: true
    func setViewController(_ viewController: UIViewController, animated: Bool = true) {
        setViewControllers([viewController], animated: animated)
    }
}

// MARK: - Custom Methods
public extension UINavigationController {

    /// Removes the given ViewController and pushes to newViewController.
    ///
    /// If no newViewController and type is empty or on top of stack it does nothing
    ///
    /// - parameters:
    ///     - viewController: ViewController that will be removed.
    ///     - newViewController: The viewController you want to push to. nil to pop.
    ///     - animated: Whether it should be animated or not.
    func replaceViewController(_ vc: UIViewController?, withNew newVC: UIViewController? = nil, animated: Bool = true) {
        replaceViewControllers([vc], withNew: newVC, animated: animated)
    }

    /// Removes the last n ViewControllers and pushes to newViewController.
    ///
    /// If no newViewController and type is empty or on top of stack it does nothing
    ///
    /// - parameters:
    ///     - count: Number of viewControllers that will be removed (>0).
    ///     - newViewController: The viewController you want to push to. nil to pop.
    ///     - animated: Whether it should be animated or not.
    func replaceViewControllers(last count: Int, withNew newVC: UIViewController? = nil, animated: Bool = true) {
        guard count > 0 else {
            if let newVC = newVC {
                pushViewController(newVC, animated: animated)
            }
            return
        }

        var vcs: [UIViewController] = []

        for (i, vc) in viewControllers.reversed().enumerated() {
            guard i < count else {
                break
            }
            vcs.append(vc)
        }

        replaceViewControllers(vcs, withNew: newVC, animated: animated)
    }

    /// Removes all given ViewController and pushes to newViewController.
    ///
    /// If no newViewController and type is empty or on top of stack it does nothing
    ///
    /// - parameters:
    ///     - viewControllers: ViewControllers that will be removed.
    ///     - newViewController: The viewController you want to push to. nil to pop.
    ///     - animated: Whether it should be animated or not.
    func replaceViewControllers(_ vcs: [UIViewController?], withNew newVC: UIViewController? = nil, animated: Bool = true) {
        let vcs = vcs.unwrapped
        var vcStack = viewControllers

        if vcs.count > 0 {
            for vc in vcs {
                guard let index = vcStack.index(of: vc) else {
                    continue
                }

                vcStack.remove(at: index)
            }
        }

        if let newVC = newVC {
            vcStack.append(newVC)
        }

        setViewControllers(vcStack, animated: animated)
    }

    /// Removes all ViewControllers newer and the given one and pushes to newViewController.
    ///
    /// If no newViewController and type is empty or on top of stack it does nothing
    ///
    /// - parameters:
    ///     - viewController: ViewController that will be removed along with every newer ViewController.
    ///     - newViewController: The viewController you want to push to. nil to pop.
    ///     - animated: Whether it should be animated or not.
    func replaceViewControllers(afterAndIncluding vc: UIViewController?, withNew newVC: UIViewController? = nil, animated: Bool = true) {
        replaceViewControllersAfter(vc, including: true, newVC: newVC, animated: animated)
    }

    /// Removes all ViewControllers newer than the given one and pushes to newViewController.
    ///
    /// If no newViewController and type is empty or on top of stack it does nothing
    ///
    /// - parameters:
    ///     - viewController: ViewController after which every viewController will be removed.
    ///     - newViewController: The viewController you want to push to. nil to pop.
    ///     - animated: Whether it should be animated or not.
    func replaceViewControllers(after vc: UIViewController?, withNew newVC: UIViewController? = nil, animated: Bool = true) {
        replaceViewControllersAfter(vc, including: false, newVC: newVC, animated: animated)
    }

    private func replaceViewControllersAfter(_ vc: UIViewController?, including: Bool, newVC: UIViewController? = nil, animated: Bool = true) {
        var vcStack = viewControllers
        let count = vcStack.count
        let checkIndex = including ? count : count - 1

        guard let vc = vc, var index = vcStack.index(of: vc), index < checkIndex else {
            if let newVC = newVC {
                pushViewController(newVC, animated: animated)
            }
            return
        }

        index += including ? 0 : 1

        vcStack.removeSubrange(index ..< count)

        if let newVC = newVC {
            vcStack.append(newVC)
        }

        setViewControllers(vcStack, animated: animated)
    }
}

extension Array where Element: Comparable & Hashable {

    var noDuplicatesAndSorted: [Element] {
        let array = Array(Set(self))
        return array.sorted(by: { $0 < $1 })
    }
}

protocol OptionalType {
    associatedtype Wrapped
    var value: Wrapped? { get }
}

extension Optional: OptionalType {

    var value: Wrapped? { return self }
}

extension Sequence where Iterator.Element: OptionalType {

    var unwrapped: [Iterator.Element.Wrapped] {
        return flatMap { $0.value }
    }
}
