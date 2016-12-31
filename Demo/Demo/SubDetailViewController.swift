//
//  SubDetailViewController.swift
//  SplitViewCoordinator
//
//  Created by Jan Dammshäuser on 24.12.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import JDCoordinator

class SubDetailViewController: UIViewController {
    
    weak var delegate: JDCoordinatorViewControllerDelegate!

    @IBOutlet weak var dataLbl: UILabel!
    
    var data: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataLbl.text = data
    }
    
    override func didMove(toParentViewController parent: UIViewController?) {
        super.didMove(toParentViewController: parent)
        delegate?.presentedVC?(self, movedTo: parent)
    }
    
    deinit {
        NSLog("\(type(of: self)) \(data ?? "") got deinitialized")
    }
}