//
//  StartTestable.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 10.03.18.
//

import Foundation

protocol StartTestable: AnyObject {
    var startedCount: Int { get set }
}

extension StartTestable {
    var isStarted: Bool {
        return startedCount >= 1
    }

    func started() {
        startedCount += 1
    }
}
