//
//  DetailCoordinator.swift
//  SplitViewCoordinator
//
//  Created by Jan Dammshäuser on 26.12.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import JDCoordinator

class DetailCoordinator: JDCoordinator {
    
    var data: String?
    
    weak var delegate: JDCoordinatorCoordinatorDelegate!
    
    override func start() {
        super.start()

        let vc = DetailViewController()
        vc.delegate = self
        vc.data = data
        
        pushViewController(vc, animated: true)
    }

    deinit {
        NSLog("\(type(of: self)) \(data ?? "") got deinitialized")
    }
}

extension DetailCoordinator: DetailViewDelegate {
    
    func showSubDetails() {
        let vc = SubDetailViewController()
        vc.delegate = self
        vc.data = data
        
        pushViewController(vc, animated: true)
    }
}
