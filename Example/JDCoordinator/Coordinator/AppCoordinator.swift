//
//  JDAppCoordinator.swift
//  Demo
//
//  Created by Jan Dammshäuser on 05.09.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import JDCoordinator

class AppCoordinator: JDAppCoordinator, MainCoordinatorDelegate {

    weak var main: MainCoordinator!

    override func start() {
        super.start()

        getData { _ in
            self.showMain()
        }

        let introVC = IntroVC()
        setViewController(introVC, animated: true)
    }

    func getData(_ completion: @escaping (Bool) -> Void) {

        // This function "downloads" data for three seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion(true)
        }
    }

    func reloadData() {
        start()
    }

    func showMain() {
        let coord = MainCoordinator(with: navigationController, andAddToParent: self)
        coord.delegate = self
        coord.start()
        main = coord
    }
}
