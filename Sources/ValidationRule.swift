//
//  ValidationRule.swift
//  TinyValidation
//
//  Created by Roy Hsu on 2018/9/9.
//

// MARK: - ValidationRule

public protocol ValidationRule {

    associatedtype Value

    @discardableResult
    func validate(_ value: Value?) throws -> Value

}

// MARK: - AnyValidationRule

public struct AnyValidationRule<Value>: ValidationRule {

    private let _validate: (Value?) throws -> Value

    public init<R: ValidationRule>(_ rule: R) where R.Value == Value { self._validate = rule.validate }

    @discardableResult
    public func validate(_ value: Value?) throws -> Value { return try _validate(value) }

}
