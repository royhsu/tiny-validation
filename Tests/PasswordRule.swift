//
//  PasswordRule.swift
//  TinyValidation Tests
//
//  Created by Roy Hsu on 2018/9/9.
//

// MARK: - PasswordRule

import TinyValidation

internal enum PasswordRule: ValidationRule {

    case minimumLength(Int)

    case maximumLength(Int)

    @discardableResult
    internal func validate(_ value: String?) throws -> String {

        let value = try value.validated(
            by: NotNilRule()
        )

        switch self {

        case let .minimumLength(length):

            if value.count < length { throw PasswordError.minimumLength(length) }

            return value

        case let .maximumLength(length):

            if value.count > length { throw PasswordError.maximumLength(length) }

            return value

        }

    }

}
