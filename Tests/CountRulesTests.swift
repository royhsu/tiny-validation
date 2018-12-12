//
//  CountRulesTests.swift
//  TinyValidation Tests
//
//  Created by Roy Hsu on 2018/9/9.
//

// MARK: - CountRulesTests

import XCTest

@testable import TinyValidation

internal final class CountRulesTests: XCTestCase {

    internal final func testValidateRules() {

        let rule = CountRule<String>(range: 8...10)

        XCTAssertNoThrow(
            try "12345678".validated(by: rule)
        )

        XCTAssertThrowsError(
            try "1234".validated(by: rule)
        ) { error in

            if let error = error as? CountError {

                XCTAssertEqual(
                    error.range,
                    8...10
                )

            }
            else { XCTFail("Unexpected error: \(error).") }

        }

        XCTAssertThrowsError(
            try "1234567890ab".validated(by: rule)
        ) { error in

            if let error = error as? CountError {

                XCTAssertEqual(
                    error.range,
                    8...10
                )

            }
            else { XCTFail("Unexpected error: \(error).") }

        }

    }

}
