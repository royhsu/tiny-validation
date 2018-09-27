//
//  NotNilRuleTests.swift
//  TinyValidation
//
//  Created by Roy Hsu on 2018/9/27.
//

// MARK: - NotNilRuleTests

import XCTest

@testable import TinyValidation

internal final class NotNilRuleTests: XCTestCase {

    internal final func testValidate() {

        let message: String? = "hello"

        XCTAssertNoThrow(
            try message?.validated(
                by: NotNilRule()
            )
        )

        let nilMessage: String? = nil

        XCTAssertThrowsError(
            try nilMessage.validated(
                by: NotNilRule()
            )
        ) { error in

            if case NotNilError.isNil = error {

                XCTSuccess()

                return

            }

            XCTFail("Unexpected error: \(error).")

        }

    }

}
