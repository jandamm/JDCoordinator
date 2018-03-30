//
//  HelperTests.swift
//  JDCoordinator_Tests
//
//  Created by Jan Dammshäuser on 29.03.18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

@testable import JDCoordinator
import XCTest

class HelperTests: XCTestCase {
    func testClamped() {
        XCTAssertEqual((-2).clamped(to: -1...2), -1)

        XCTAssertEqual(0.clamped(to: 1...8), 1)
        XCTAssertEqual(1.clamped(to: 1...8), 1)
        XCTAssertEqual(4.clamped(to: 1...8), 4)
        XCTAssertEqual(8.clamped(to: 1...8), 8)
        XCTAssertEqual(9.clamped(to: 1...8), 8)

        XCTAssertEqual(100.clamped(to: 9...12), 12)
    }

    #if swift(>=4.1)
    #else
        func testCompactMap() {
            let array: [String?] = ["aa", nil, "asr", nil, "artt"]
            let mapper: (String?) -> String? = { $0 }
            XCTAssertEqual(array.flatMap(mapper), array.compactMap(mapper))
        }
    #endif
}
