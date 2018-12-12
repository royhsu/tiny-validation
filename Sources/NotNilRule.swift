//
//  NonnullRule.swift
//  TinyValidation
//
//  Created by Roy Hsu on 2018/9/27.
//

// MARK: - NonnullRule

public struct NonnullRule<Value>: ValidationRule {

    public init() { }

    public func validate(_ value: Value?) throws -> Value {

        if let value = value { return value }

        throw NotNilError()

    }

}

public extension AnyValidationRule {

    public static var notNil: AnyValidationRule<Value> {

        return AnyValidationRule(
            NonnullRule()
        )

    }

}
