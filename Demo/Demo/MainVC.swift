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

    // needed on iOS 8
    init() {
        super.init(nibName: "MainVC", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    weak var delegate: MainDelegate!

    @IBAction func reloadData(_: UIButton) {
        delegate.reloadData()
    }

    @IBAction func showSplit(_: UIButton) {
        delegate.showSplit()
    }

    deinit {
        NSLog("\(type(of: self)) got deinitialized")
    }
}
