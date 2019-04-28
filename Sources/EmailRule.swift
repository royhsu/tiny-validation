//
//  EmailRule.swift
//  TinyValidation
//
//  Created by Roy Hsu on 2018/9/9.
//

// MARK: - EmailRule

public struct EmailRule: ValidationRule {

    private let regex: String

    private init(regex: String) { self.regex = regex }

    @discardableResult
    public func validate(_ email: String?) throws -> String {

        let email = try email.explicitValidated(
            by: NonNullRule()
        )

        let range = email.range(
            of: regex,
            options: .regularExpression
        )

        if range == nil { throw EmailError.invalidFormat }

        return email

    }

}

extension EmailRule {

    // swiftlint:disable line_length
    public static let standard = EmailRule(regex: "^[_A-Za-z0-9-+]+(\\.[_A-Za-z0-9-+]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z‌​]{2,})$")
    // swiftlint:enable line_length

}

public extension AnyValidationRule where Value == String {
    
    public static func email(match rule: EmailRule = .standard) -> AnyValidationRule<Value> {
        
        return AnyValidationRule(rule)
        
    }
    
}
