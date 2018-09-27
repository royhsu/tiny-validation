//
//  NotEmptyTests.swift
//  TinyValidationTests
//
//  Created by Roy Hsu on 2018/9/25.
//

// MARK: - NotEmptyTests

import XCTest

@testable import TinyValidation

internal final class NotEmptyTests: XCTestCase {

    internal final func testValidateNonEmpty() {

        XCTAssertNoThrow(
            try "hello".validated(
                by: NotEmptyRule()
            )
        )

        XCTAssertThrowsError(
            try "".validated(
                by: NotEmptyRule()
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
