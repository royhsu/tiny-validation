//
//  NonNullRuleTests.swift
//  TinyValidation Tests
//
//  Created by Roy Hsu on 2018/9/27.
//

// MARK: - NonNullRuleTests

import XCTest

@testable import TinyValidation

internal final class NonNullRuleTests: XCTestCase {

    internal final func testValidate() {

        let message: String? = "hello"

        XCTAssertNoThrow(
            try message.explicitValidated(
                by: NonNullRule()
            )
        )

        let nilMessage: String? = nil

        XCTAssertThrowsError(
            try nilMessage.explicitValidated(
                by: NonNullRule()
            )
        ) { error in

            if error is NonNullError { XCTSuccess(); return }

            XCTFail("Unexpected error: \(error).")

        }

    }

}
