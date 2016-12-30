//
//  JDSplitViewCoordinator.swift
//  SplitViewCoordinator
//
//  Created by Jan Dammshäuser on 24.12.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

open class JDSplitViewCoordinator: JDParentCoordinator, JDSplitViewCoordinatorProtocol, UISplitViewControllerDelegate {

    /// Set Master Coordinator if needed with setMasterViewController
    public private(set) weak var masterCoordinator: JDCoordinator?
    
    /// Reference to the masterNavigationController
    public private(set) weak var masterNavigationController: UINavigationController!
    
    /// Reference to the detailNavigationController
    public private(set) weak var detailNavigationController: UINavigationController!

    /// You can modify the splitViewController behaviour or set your custom JDSplitViewController with its initializer.
    /// Don't forget to set splitViews.coordinator to self.
    public private(set) lazy var splitViewController: JDSplitViewController = {
        let svc = JDSplitViewController()
        svc.delegate = self
        svc.coordinator = self
        return svc
    }()

    /// Use the splitViewPresenter to present the splitViewController within the navigationController
    public private(set) lazy var splitViewPresenter: UIViewController = {
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.clear
        vc.addChildViewController(self.splitViewController)
        vc.view.addSubview(self.splitViewController.view)
        return vc
    }()

    /// Use this convenience init to set a custom SplitViewController
    public convenience init(withNavigationController navigationController: UINavigationController, andSplitViewController splitView: JDSplitViewController) {
        self.init(withNavigationController: navigationController)

        splitViewController = splitView
    }

    /// Override this method to start your custom SplitViewController.
    /// You should call super.start, setMasterViewController, showDetailViewController and push/set/present splitViewPresenter.
    open override func start() {
        super.start()
        navigationController.setNavigationBarHidden(true, animated: true)
    }
    
    public func showMasterViewController(_ vc: UINavigationController, withMasterCoordinator coord: JDCoordinator? = nil, andStart start: Bool = false) {
        
        addChildCoordinator(coord, andStart: start)
        splitViewController.showMasterViewController(vc)
        
        masterNavigationController = vc
        masterCoordinator = coord
    }
    
    public func showDetailViewController(_ vc: UIViewController, withDetailCoordinator coord: JDCoordinator?, andStart start: Bool = false, sender: Any? = nil) {
        removeAllDetailCoordinator()

        addChildCoordinator(coord, andStart: start)

        splitViewController.showDetailViewController(vc, sender: sender)
    }
    
    private func addChildCoordinator(_ coord: JDCoordinator?, andStart start: Bool) {

        guard let coord = coord else {
            return
        }
        
        addChildCoordinator(coord)
            
        if start {
            coord.start()
        }
    }
}
