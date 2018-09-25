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

    public func validate(_ value: Value) throws -> Value {

        if value.isEmpty { throw NonEmptyError.empty }

        return value

    }

}
