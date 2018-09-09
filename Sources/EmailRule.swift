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
    public func validate(_ value: String) throws -> String {

        let range = value.range(
            of: regex,
            options: .regularExpression
        )

        if range == nil { throw EmailError.invalidFormat }

        return value

    }

}

public extension EmailRule {

    public static let standard = EmailRule(regex: "^[_A-Za-z0-9-+]+(\\.[_A-Za-z0-9-+]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z‌​]{2,})$")

}
