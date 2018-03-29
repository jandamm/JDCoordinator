// Generated using Sourcery 0.10.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

public extension RootNavigating {
    func pushViewController(_ viewController: UIViewController, animated: Bool) {
        navigationController.pushViewController(viewController, animated: animated)
    }

    @discardableResult
    func popViewController(animated: Bool) -> UIViewController? {
        return navigationController.popViewController(animated: animated)
    }

    @discardableResult
    func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        return navigationController.popToViewController(viewController, animated: animated)
    }

    @discardableResult
    func popToRootViewController(animated: Bool) -> [UIViewController]? {
        return navigationController.popToRootViewController(animated: animated)
    }

    func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        navigationController.setViewControllers(viewControllers, animated: animated)
    }

    func present(_ viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?) {
        navigationController.present(viewControllerToPresent, animated: animated, completion: completion)
    }

    func dismiss(animated: Bool, completion: (() -> Void)?) {
        navigationController.dismiss(animated: animated, completion: completion)
    }

    func setViewController(_ viewController: UIViewController, animated: Bool) {
        navigationController.setViewController(viewController, animated: animated)
    }

    func replaceViewController(_ viewController: UIViewController, withNew newViewController: UIViewController, animated: Bool) {
        navigationController.replaceViewController(viewController, withNew: newViewController, animated: animated)
    }

    func replaceViewControllers(_ viewControllers: [UIViewController], withNew newViewController: UIViewController, animated: Bool) {
        navigationController.replaceViewControllers(viewControllers, withNew: newViewController, animated: animated)
    }

    func replaceLastViewControllers(count: Int, withNew newViewController: UIViewController, animated: Bool) {
        navigationController.replaceLastViewControllers(count: count, withNew: newViewController, animated: animated)
    }
}
