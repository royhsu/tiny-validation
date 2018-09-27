//
//  EmailRuleTests.swift
//  TinyValidation Tests
//
//  Created by Roy Hsu on 2018/9/9.
//

// MARK: - EmailRuleTests

import XCTest

@testable import TinyValidation

internal final class EmailRuleTests: XCTestCase {

    internal final func testValidate() {

        XCTAssertNoThrow(
            try "hello@example.com".validated(by: EmailRule.standard)
        )

        XCTAssertThrowsError(
            try "invalid email".validated(by: EmailRule.standard)
        ) { error in

            if case EmailError.invalidFormat = error {

                XCTSuccess()

                return

            }

            XCTFail("Unexpected error: \(error).")

        }

    }

}
