//
//  MainVC.swift
//  Demo
//
//  Created by Jan Dammshäuser on 05.09.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import JDCoordinator

protocol MainDelegate: JDCoordinatorDelegate {
	func reloadData()
}

class MainVC: UIViewController {

	weak var delegate: MainDelegate?

	@IBAction func reloadData(_ sender: UIButton) {
		delegate?.reloadData()
	}

	deinit {
		NSLog("MainVC got deinitialized")
	}
}
