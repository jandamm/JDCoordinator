//
//  AnyHashableConvertible.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 10.03.18.
//

import Foundation

/// This protocol is a helper remove the `Self` constraint when applying `Hashable`.
///
/// You should not be required to implement this directly. Just implement `Hashable`.
public protocol AnyHashableConvertible {
    var anyHashable: AnyHashable { get }
}

extension AnyHashableConvertible where Self: Hashable {
    public var anyHashable: AnyHashable {
        return self as AnyHashable
    }
}
