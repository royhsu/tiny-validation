//
//  NotEmptyRule.swift
//  TinyValidation
//
//  Created by Roy Hsu on 2018/9/25.
//

// MARK: - NotEmptyRule

import TinyCore

public struct NotEmptyRule<Value>: ValidationRule where Value: Emptible {

    public init() { }

    public func validate(_ value: Value?) throws -> Value {

        let value = try value.explicitlyValidated(
            by: NotNilRule()
        )

        if value.isEmpty { throw NotEmptyError.isEmpty }

        return value

    }

}
