//
//  Identifiable.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 30.03.18.
//

import Foundation

protocol Identifiable: AnyHashableConvertible, Hashable {
    var uuid: UUID { get }
}

extension Identifiable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.uuid == rhs.uuid
    }

    public var hashValue: Int {
        return uuid.hashValue
    }
}
