//
//  DetailViewController.swift
//  SplitViewCoordinator
//
//  Created by Jan Dammshäuser on 24.12.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import JDCoordinator

protocol DetailViewDelegate: ControllerDelegate {
    func showSubDetails()
}

class DetailViewController: UIViewController {
    // needed on iOS 8
    init() {
        super.init(nibName: "DetailViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    weak var delegate: DetailViewDelegate!

    var data: String?

    @IBOutlet var dataLbl: UIButton!

    @IBAction func btnPressed(_: UIButton) {
        delegate.showSubDetails()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        dataLbl.setTitle(data, for: .normal)
    }

    override func didMove(toParentViewController parent: UIViewController?) {
        super.didMove(toParentViewController: parent)
        delegate?.presentedViewController(self, didMoveTo: parent)
    }

    deinit {
        NSLog("\(type(of: self)) \(data ?? "") got deinitialized")
    }
}
