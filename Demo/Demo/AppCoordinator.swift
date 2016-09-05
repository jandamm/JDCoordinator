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
        let introVC = IntroVC()
        
        getData { (successful) in
            self.showMainVC()
        }
        
        setViewControllers(introVC, animated: true)
    }
    
    func getData(completion: (Bool)->()) {
        
        // This function "downloads" data for three seconds
        
        let dispatchTime: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(3 * Double(NSEC_PER_SEC)))
        dispatch_after(dispatchTime, dispatch_get_main_queue(), { completion(true) })
    }
    
    func reloadData(finishedCoordinator: JDCoordinator) {
        removeChildCoordinator(finishedCoordinator)
        
        start()
    }
    
    private func showMainVC() {
        let coord = MainCoordinator(withNavigationController: navigationController)
        
        coord.delegate = self
        
        addChildCoordinator(coord)
        
        coord.start()
    }
    
}
