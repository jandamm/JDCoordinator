//
//  JDSplitViewCoordinator.swift
//  SplitViewCoordinator
//
//  Created by Jan Dammshäuser on 24.12.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

// TODO: - Implement Protocol

/// JDSplitViewCoordinators are meant to coordinate one or more JDCoordinators and ViewControllers within an UISplitViewController and presented within an UINavigationController.
// @objc class JDSplitViewCoordinator: JDParentCoordinator, JDSplitViewCoordinatorProtocol, UISplitViewControllerDelegate {
//
//    var _rootSplitViewCoordinator = false
//
//    /// Set Master Coordinator if needed with setMasterViewController
//    private(set) public weak var masterCoordinator: JDCoordinator?
//
//    /// Reference to the masterNavigationController
//    private(set) public weak var masterNavigationController: UINavigationController!
//
//    /// Reference to the detailNavigationController
//    private(set) public weak var detailNavigationController: UINavigationController!
//
//    /// You can modify the splitViewController behaviour or set your custom JDSplitViewController with its initializer.
//    /// Don't forget to set splitViews.coordinator to self.
//    public var splitViewController: JDSplitViewController {
//        return _splitViewController
//    }
//
//    lazy var _splitViewController: JDSplitViewController = {
//        let svc = JDSplitViewController()
//        svc.delegate = self
//        svc.coordinator = self
//        return svc
//    }()
//
//    /// Use the splitViewPresenter to push/present the splitViewController within the navigationController
//    public var splitViewPresenter: UIViewController {
//        return _splitViewPresenter
//    }
//
//    private lazy var _splitViewPresenter: UIViewController = {
//        let vc = UIViewController()
//        vc.view.backgroundColor = UIColor.clear
//        vc.addChildViewController(self.splitViewController)
//        vc.view.addSubview(self.splitViewController.view)
//        self.splitViewController.didMove(toParentViewController: vc)
//        return vc
//    }()
//
//    /// Use this convenience init to set a custom SplitViewController
//    public convenience init(with navigationController: UINavigationController, andSplitViewController splitView: JDSplitViewController) {
//        self.init(with: navigationController)
//
//        _splitViewController = splitView
//    }
//
//    /// Override this method to start your custom SplitViewController.
//    /// You should call super.start, setMasterViewController, showDetailViewController and push/set/present splitViewPresenter.
//    open override func start() {
//        super.start()
//        guard !_rootSplitViewCoordinator else {
//            return
//        }
//        navigationController.setNavigationBarHidden(true, animated: true)
//    }
//
//    /// Sets the given ViewController as MasterViewController and sets the MasterCoordinator.
//    /// You can only set the masterViewController once. If you need to change the masters view, implement it into MasterCoordinator and use masterNavigationController to do so.
//    /// You can start the coordinator within this method.
//    public func setMasterNavigationController(_ vc: UINavigationController, withMasterCoordinator masterCoord: JDCoordinator? = nil, andStart start: Bool = false) {
//
//        do {
//            try splitViewController.setMasterViewController(vc)
//
//            removeMasterCoordinator()
//            addChildCoordinator(masterCoord, andStart: start)
//
//            masterNavigationController = vc
//            masterCoordinator = masterCoord
//        } catch UISplitViewController.SetMasterVCError.alreadySet(let error) {
//            NSLog(error)
//        } catch {
//            NSLog("[JDCoordinator] Some error while setting MasterViewController")
//        }
//    }
//
//    /// Sets the given ViewController as DetailViewController and removes all previous DetailCoordinators.
//    /// You can start the coordinator within this method.
//    public func showDetailNavigationController(_ vc: UINavigationController, withDetailCoordinator coord: JDCoordinator?, andStart start: Bool = false, fromSender sender: Any? = nil) {
//        removeAllDetailCoordinator()
//
//        detailNavigationController = vc
//
//        addChildCoordinator(coord, andStart: start)
//
//        splitViewController.showDetailViewController(vc, sender: sender)
//    }
//
//    /// Removes all DetailCoordinators
//    public func removeAllDetailCoordinator() {
//        removeAllChildCoordinators(except: masterCoordinator)
//    }
//
//    private func removeMasterCoordinator() {
//        guard let coord = masterCoordinator else {
//            return
//        }
//
//        removeChildCoordinator(coord)
//    }
//
//    private func addChildCoordinator(_ coord: JDCoordinator?, andStart start: Bool) {
//
//        guard let coord = coord else {
//            return
//        }
//
//        addChildCoordinator(coord)
//
//        if start {
//            coord.start()
//        }
//    }
// }
