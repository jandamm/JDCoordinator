//
//  UINavigationController.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 23.01.2017.
//  Copyright © 2017 Jan Dammshäuser. All rights reserved.
//

import Foundation

public enum ViewControllerType {
    case current
    case previous

    func vc(for coord: JDNavigationCoordinator) -> UIViewController? {
        switch self {
        case .current: return coord.navigationController.topViewController
        case .previous: return coord.previousViewController
        }
    }
}

// MARK: - Default Methods
public extension UIViewController {

    func present(_ viewControllerToPresent: UIViewController, completion: (() -> Void)? = nil) {
        present(viewControllerToPresent, animated: true, completion: completion)
    }

    func dismiss(completion: (() -> Void)? = nil) {
        dismiss(animated: true, completion: completion)
    }
}

public extension UINavigationController {

    func pushViewController(_ viewController: UIViewController) {
        pushViewController(viewController, animated: true)
    }

    @discardableResult func popViewController() -> UIViewController? {
        return popViewController(animated: true)
    }

    @discardableResult func popToViewController(_ viewController: UIViewController) -> [UIViewController]? {
        return popToViewController(viewController, animated: true)
    }

    @discardableResult func popToRootViewController() -> [UIViewController]? {
        return popToRootViewController(animated: true)
    }

    @nonobjc func setViewControllers(_ viewControllers: [UIViewController]) {
        setViewControllers(viewControllers, animated: true)
    }
}

// MARK: - Custom Methods
public extension UINavigationController {

    public func setViewController(_ viewController: UIViewController, animated: Bool = true) {
        setViewControllers([viewController], animated: animated)
    }

    /// Use method to replace current UINavigationControllers topViewController
    public func replaceViewController(currentWithNew newVC: UIViewController?, animated: Bool = true) {
        replaceViewController(topViewController, withNew: newVC, animated: animated)
    }

    /// Use method to replace the given UIViewController, nil will pushViewController
    public func replaceViewController(_ vc: UIViewController?, withNew newVC: UIViewController? = nil, animated: Bool = true) {
        replaceViewControllers([vc], withNew: newVC, animated: animated)
    }

    /// Use method to replace UINavigationControllers last x topViewController
    public func replaceViewControllers(last count: Int, withNew newVC: UIViewController? = nil, animated: Bool = true) {
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

    /// Use method to replace the given Array of UIViewController, nil will pushViewController
    public func replaceViewControllers(_ vcs: [UIViewController?], withNew newVC: UIViewController? = nil, animated: Bool = true) {
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

    /// Removes the given and all newer ViewControllers and pushes to newViewController. Pops if no newVC is given.
    /// If no newVC and no replaceVCs are given or replaceVC is on top of stack it does nothing
    public func replaceViewControllers(afterAndIncluding vc: UIViewController?, withNew newVC: UIViewController? = nil, animated: Bool = true) {
        replaceViewControllersAfter(vc, including: true, newVC: newVC, animated: animated)
    }

    /// Removes all ViewControllers newer than the given one and pushes to newViewController. Pops if no newVC is given.
    /// If no newVC and no replaceVCs are given or replaceVC is on top of stack it does nothing
    public func replaceViewControllers(after vc: UIViewController?, withNew newVC: UIViewController? = nil, animated: Bool = true) {
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
    func map<U>(_ f: (Wrapped) throws -> U) rethrows -> U?
}

extension Optional: OptionalType {}

extension Sequence where Iterator.Element: OptionalType {
    var unwrapped: [Iterator.Element.Wrapped] {
        var result: [Iterator.Element.Wrapped] = []
        for element in self {
            if let element = element.map({ $0 }) {
                result.append(element)
            }
        }
        return result
    }
}
