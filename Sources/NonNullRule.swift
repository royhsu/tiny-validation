//
//  NonNullRule.swift
//  TinyValidation
//
//  Created by Roy Hsu on 2018/9/27.
//

// MARK: - NonNullRule

public struct NonNullRule<Value>: ValidationRule {

    public init() { }

    public func validate(_ value: Value?) throws -> Value {

        if let value = value { return value }

        throw NonNullError()

    }

}

extension AnyValidationRule {

    public static var nonNull: AnyValidationRule<Value> {

        return AnyValidationRule(
            NonNullRule()
        )

    }

}
