//
//  JDSplitViewManager.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 19.12.2016.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import Foundation

@objc
open class JDSplitViewManager: NSObject, JDSplitViewManagerProtocol {

    @objc public enum SplitViewMode: Int {
        case always, never, iPhoneOnly, iPadOnly
    }

    /// Mode of JDSplitViewManager
    public let mode: SplitViewMode

    /// SplitViewPresenter, if nil splitview is disabled
    public var splitViewPresenter: UIViewController? {
        return splitViewEnabled ? presenter : nil
    }

    /// Use SplitViewController to modify behavior
    public var splitViewController: JDSplitViewController {
        return splitView
    }

    /// Left Controller or default controller - depending if splitview is enabled
    public var leftController: UINavigationController {
        return splitViewEnabled ? left : navigation
    }

    /// Right Controller or default controller - depending if splitview is enabled
    public var rightController: UINavigationController {
        return splitViewEnabled ? right : navigation
    }

    // MARK: - Private Properties
    private let splitViewEnabled: Bool
    private unowned let navigation: UINavigationController
    private lazy var presenter: UIViewController = {
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.clear
        vc.addChildViewController(self.splitView)
        vc.view.addSubview(self.splitView.view)
        return vc
    }()
    private lazy var splitView: JDSplitViewController = {
        let svc = JDSplitViewController()
        svc.delegate = self
        svc.addChildViewController(self.left)
        svc.addChildViewController(self.right)
        return svc
    }()
    private lazy var left: UINavigationController = { UINavigationController() }()
    private lazy var right: UINavigationController = { UINavigationController() }()

    // MARK: - Initializers
    public required init(withNavigationController navigationController: UINavigationController, andMode mode: JDSplitViewManager.SplitViewMode, leftNavigationController left: UINavigationController? = nil, rightNavigationController right: UINavigationController? = nil) {
        self.navigation = navigationController
        self.mode = mode

        switch mode {
        case .always: splitViewEnabled = true
        case .never: splitViewEnabled = false
        case .iPhoneOnly: splitViewEnabled = UIDevice.current.userInterfaceIdiom == .phone
        case .iPadOnly: splitViewEnabled = UIDevice.current.userInterfaceIdiom == .pad
        }

        super.init()

        if let left = left {
            self.left = left
        }

        if let right = right {
            self.right = right
        }
    }
}
