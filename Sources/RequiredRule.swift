//
//  RequiredRule.swift
//  TinyValidation
//
//  Created by Roy Hsu on 2018/9/27.
//

// MARK: - RequiredRule

import TinyCore

public struct RequiredRule<Value>: ValidationRule
where Value: Validatable & Emptible {

    public func validate(_ value: Value?) throws -> Value {

        let value = try value.validated(
            by: NotNilRule()
        )

        return try value.validated(
            by: NotEmptyRule()
        )

    }

}
