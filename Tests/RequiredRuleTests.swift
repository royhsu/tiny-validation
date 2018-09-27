//
//  RequiredRuleTests.swift
//  TinyValidation
//
//  Created by Roy Hsu on 2018/9/27.
//

// MARK: - RequiredRuleTests

import XCTest

@testable import TinyValidation

internal final class RequiredRuleTests: XCTestCase {

    internal final func testValidate() {

        let message: String? = "hello"

        XCTAssertNoThrow(
            try message.validated(
                by: RequiredRule()
            )
        )

        let nilMessage: String? = nil

        XCTAssertThrowsError(
            try nilMessage.validated(
                by: RequiredRule()
            )
        ) { error in

            if case NotNilError.isNil = error {

                XCTSuccess()

                return

            }

            XCTFail("Unexpected error: \(error).")

        }

        let emptyMessage: String? = ""

        XCTAssertThrowsError(
            try emptyMessage.validated(
                by: RequiredRule()
            )
        ) { error in

            if case NotEmptyError.isEmpty = error {

                XCTSuccess()

                return

            }

            XCTFail("Unexpected error: \(error).")

        }

    }

}
