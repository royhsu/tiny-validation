//
//  Optional+Validatable.swift
//  TinyValidation
//
//  Created by Roy Hsu on 2018/9/27.
//

// MARK: - Validatable

// swiftlint:disable syntactic_sugar
public extension Optional {

    /// Similiar to explicitValidated(by rule:)
    @discardableResult
    public func explicitValidated(
        by validator: (Optional<Wrapped>) throws -> Wrapped
    )
    rethrows -> Wrapped { return try validator(self) }

    /// If the nil value is one of requirements to validate, and you don't want to skip the validation by optional chaining.
    /// Please use these two explicit validation methods.
    ///
    /// Example:
    ///
    /// ```
    /// var message: String? = nil
    ///
    /// // The validation rule will be triggered.
    /// let result: String = try message.explicitValidated(by: rule)
    ///
    /// // The validation will be skipped due to optional chaining
    /// let result: String? = try message?.validated(by: rule)
    /// ```
    ///
    @discardableResult
    public func explicitValidated<R: ValidationRule>(by rule: R) throws -> Wrapped where R.Value == Wrapped { return try rule.validate(self) }

}
// swiftlint:enable syntactic_sugar
