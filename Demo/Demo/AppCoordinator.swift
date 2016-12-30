//
//  JDAppCoordinator.swift
//  Demo
//
//  Created by Jan Dammshäuser on 05.09.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import JDCoordinator

class AppCoordinator: JDParentCoordinator, MainCoordinatorDelegate {

	override func start() {
        super.start()

		getData { (successful) in
			self.showMain()
		}

        let introVC = IntroVC()
		setViewControllers(introVC, animated: true)
	}

	func getData(_ completion: @escaping(Bool) -> ()) {

		// This function "downloads" data for three seconds
		DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion(true)
        }
	}

	func reloadData() {
		start()
	}
    
    func showMain() {
        let coord = MainCoordinator(withNavigationController: navigationController)
        coord.delegate = self
        addChildCoordinator(coord)
        coord.start()
    }
}
