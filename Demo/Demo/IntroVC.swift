//
//  IntroVC.swift
//  Demo
//
//  Created by Jan Dammshäuser on 05.09.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

class IntroVC: UIViewController {
    
    // needed on iOS 8
    init() {
        super.init(nibName: "IntroVC", bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

	deinit {
		NSLog("\(type(of: self)) got deinitialized")
	}
}
