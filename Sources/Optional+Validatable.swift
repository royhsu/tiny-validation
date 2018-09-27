//
//  Optional+Validatable.swift
//  TinyValidation
//
//  Created by Roy Hsu on 2018/9/27.
//

// MARK: - Validatable

// swiftlint:disable syntactic_sugar
public extension Optional {

    @discardableResult
    public func validated(
        by validator: (Optional<Wrapped>) throws -> Wrapped
    )
    rethrows -> Wrapped { return try validator(self) }

    @discardableResult
    public func validated<R>(by rule: R) throws -> Wrapped
    where
        R: ValidationRule,
        R.Value == Wrapped { return try rule.validate(self) }

}
// swiftlint:enable syntactic_sugar
