//
//  _JDStartTestable.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 10.03.18.
//

import Foundation

protocol _JDStartTestable: class {
    var startedCount: Int { get set }
}

extension _JDStartTestable {
    var isStarted: Bool {
        return startedCount >= 1
    }

    func started() {
        startedCount += 1
    }
}
