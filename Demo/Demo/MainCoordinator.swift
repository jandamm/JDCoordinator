//
//  MainCoordinator.swift
//  Demo
//
//  Created by Jan Dammshäuser on 05.09.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import JDCoordinator

protocol MainCoordinatorDelegate: JDCoordinatorDelegate {
    func reloadData(finishedCoordinator: JDCoordinator)
}

class MainCoordinator: JDCoordinator, MainDelegate {
    
    weak var delegate: MainCoordinatorDelegate?
    
    override func start() {
        let mainVC = MainVC()
        
        mainVC.delegate = self
        
        setViewControllers(mainVC, animated: true)
    }
    
    func reloadData() {
        delegate?.reloadData(self)
    }
    
    deinit {
        NSLog("MainCoordinator got deinitialized")
    }
}
