//
//  Swift4Helper.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 30.03.18.
//

import Foundation

// This is only used so the project can still be build with Swift 4.0
#if swift(>=4.1)
#else
    extension Sequence {
        func compactMap<ElementOfResult>(_ transform: (Element) throws -> ElementOfResult?) rethrows -> [ElementOfResult] {
            return try flatMap(transform)
        }
    }
#endif
