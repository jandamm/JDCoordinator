//
//  HelperExtensions.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 29.03.18.
//

import Foundation

extension SignedInteger where Self.Stride: SignedInteger {
    func clamped(to range: CountableClosedRange<Self>) -> Self {
        switch self {
        case range:
            return self
        case ...range.lowerBound:
            return range.lowerBound
        default:
            return range.upperBound
        }
    }
}
