//
//  NotNilRule.swift
//  TinyValidation
//
//  Created by Roy Hsu on 2018/9/27.
//

// MARK: - NotNilRule

public struct NotNilRule<Value>: ValidationRule {

    public init() { }

    public func validate(_ value: Value?) throws -> Value {

        if let value = value { return value }

        throw NotNilError.isNil

    }

}

public extension AnyValidationRule {
    
    public static var notNil: AnyValidationRule<Value> {
        
        return AnyValidationRule(
            NotNilRule()
        )
        
    }
    
}
