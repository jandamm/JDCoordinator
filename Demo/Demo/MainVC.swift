//
//  MainVC.swift
//  Demo
//
//  Created by Jan Dammshäuser on 05.09.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import JDCoordinator

protocol MainDelegate: JDCoordinatorViewControllerDelegate {
	func reloadData()
    func showSplit()
}

class MainVC: UIViewController {

	weak var delegate: MainDelegate?

	@IBAction func reloadData(_ sender: UIButton) {
		delegate?.reloadData()
	}
    
    @IBAction func showSplit(_ sender: UIButton) {
        delegate?.showSplit()
    }

	deinit {
		NSLog("\(type(of: self)) got deinitialized")
	}
}
