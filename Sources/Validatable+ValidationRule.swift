//
//  Validatable+ValidationRule.swift
//  TinyValidation
//
//  Created by Roy Hsu on 2018/9/9.
//

// MARK: - ValidationRule

public extension Validatable {

    @discardableResult
    public func validated<Rule: ValidationRule>(by rule: Rule)
    throws -> Self
    where Rule.Value == Self { return try validated(by: rule.validate) }

    @discardableResult
    public func validated<C: Collection, R: ValidationRule>(by rules: C)
    throws -> Self
    where
        C.Element == R,
        R.Value == Self {

        return try rules.reduce(self) { currentValue, rule in

            return try currentValue.validated(by: rule)

        }

    }

}
