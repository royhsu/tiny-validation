//
//  NonEmptyTests.swift
//  TinyValidationTests
//
//  Created by Roy Hsu on 2018/9/25.
//

// MARK: - NonEmptyTests

import XCTest

@testable import TinyValidation

internal final class NonEmptyTests: XCTestCase {

    internal final func testValidateNonEmpty() {

        XCTAssertNoThrow(
            try "hello".validated(
                by: NonEmptyRule()
            )
        )

        XCTAssertThrowsError(
            try "".validated(
                by: NonEmptyRule()
            )
        ) { error in

            if case NonEmptyError.empty = error { XCTSuccess() }
            else { XCTFail("Unexpected error: \(error).") }

        }

    }

}
