//
//  CountRule.swift
//  TinyValidation
//
//  Created by Roy Hsu on 2018/9/9.
//

// MARK: - CountRule

import TinyCore

public struct CountRule<Value>: ValidationRule where Value: Countable {

    public let range: ClosedRange<Int>

    public init(range: ClosedRange<Int>) { self.range = range }

    @discardableResult
    public func validate(_ value: Value?) throws -> Value {

        let value = try value.explicitValidated(
            by: NonNullRule()
        )

        if range.contains(value.count) { return value }

        throw CountError(range: range)

    }

}

extension AnyValidationRule where Value: Countable {

    public static func count(in range: ClosedRange<Int>) -> AnyValidationRule<Value> {

        return AnyValidationRule(
            CountRule(range: range)
        )

    }

}
