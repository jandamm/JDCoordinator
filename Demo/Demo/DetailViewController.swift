//
//  DetailViewController.swift
//  SplitViewCoordinator
//
//  Created by Jan Dammshäuser on 24.12.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import JDCoordinator

protocol DetailViewDelegate: JDCoordinatorViewControllerDelegate {
    func showSubDetails()
}

class DetailViewController: UIViewController {
    
    weak var delegate: DetailViewDelegate!

    var data: String?
    
    @IBOutlet weak var dataLbl: UIButton!
    
    @IBAction func btnPressed(_ sender: UIButton) {
        delegate.showSubDetails()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataLbl.setTitle(data, for: .normal)
    }
    
    override func didMove(toParentViewController parent: UIViewController?) {
        super.didMove(toParentViewController: parent)
        delegate?.presentedVC?(self, movedTo: parent)
    }
    
    deinit {
        NSLog("\(type(of: self)) \(data ?? "") got deinitialized")
    }
}
