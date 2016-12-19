//
//  JDAppCoordinator.swift
//  Demo
//
//  Created by Jan Dammshäuser on 05.09.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import JDCoordinator

class AppCoordinator: JDParentCoordinator, MainCoordinatorDelegate, SplitViewCoordinatorDelegate {

	override func start() {
        super.start()

		getData { (successful) in
			self.showInterface()
		}

        let introVC = IntroVC()
		setViewControllers(introVC, animated: true)
	}

	func getData(_ completion: @escaping(Bool) -> ()) {

		// This function "downloads" data for three seconds

		let dispatchTime: DispatchTime = DispatchTime.now() + Double(Int64(3 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
		DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: { completion(true) })
	}

	func reloadData(_ finishedCoordinator: JDCoordinator) {
		removeChildCoordinator(finishedCoordinator)

		start()
	}

    func showInterface() {
        let coord = SplitViewCoordinator(withNavigationController: navigationController)

        coord.delegate = self

        addChildCoordinator(coord)

        coord.start()
    }
}
