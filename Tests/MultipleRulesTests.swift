//
//  MultipleRulesTests.swift
//  TinyValidation Tests
//
//  Created by Roy Hsu on 2018/9/9.
//

// MARK: - MultipleRulesTests

import XCTest

@testable import TinyValidation

internal final class MultipleRulesTests: XCTestCase {

    internal final func testValidateRules() {

        let passwordRules: [PasswordRule] = [
            .minimumLength(8),
            .maximumLength(10)
        ]

        XCTAssertNoThrow(
            try "12345678".validated(by: passwordRules)
        )

        XCTAssertThrowsError(
            try "1234".validated(by: passwordRules)
        ) { error in

            if case let PasswordError.minimumLength(length) = error {

                XCTAssertEqual(
                    length,
                    8
                )

            }
            else { XCTFail("Unexpected error: \(error).") }

        }

        XCTAssertThrowsError(
            try "1234567890ab".validated(by: passwordRules)
        ) { error in

            if case let PasswordError.maximumLength(length) = error {

                XCTAssertEqual(
                    length,
                    10
                )

            }
            else { XCTFail("Unexpected error: \(error).") }

        }

    }

}
