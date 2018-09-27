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

    @discardableResult
    public func validated<C, R>(by rules: C) throws -> Wrapped
    where
        C: Collection,
        C.Element == R,
        R: ValidationRule,
        R.Value == Wrapped {

        let value = try rules.reduce(self) { currentValue, rule in

            return try currentValue.validated(by: rule)

        }

        return try value.validated(
            by: NotNilRule()
        )

    }

}
// swiftlint:enable syntactic_sugar
