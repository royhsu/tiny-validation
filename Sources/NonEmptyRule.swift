//
//  NonEmptyRule.swift
//  TinyValidation
//
//  Created by Roy Hsu on 2018/9/25.
//

// MARK: - NonEmptyRule

import TinyCore

public struct NonEmptyRule<Value>: ValidationRule where Value: Emptible {

    public init() { }

    public func validate(_ value: Value?) throws -> Value {

        let value = try value.explicitValidated(
            by: NonNullRule()
        )

        if value.isEmpty { throw NonEmptyError() }

        return value

    }

}

extension AnyValidationRule where Value: Emptible {

    public static var nonEmpty: AnyValidationRule<Value> {

        return AnyValidationRule(
            NonEmptyRule()
        )

    }

}
