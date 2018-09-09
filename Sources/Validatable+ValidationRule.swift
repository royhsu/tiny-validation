//
//  Validatable+ValidationRule.swift
//  TinyValidation
//
//  Created by Roy Hsu on 2018/9/9.
//

// MARK: - ValidationRule

extension Validatable {
    
    public func validated<Rule: ValidationRule>(by rule: Rule) throws -> Self where Rule.Value == Self {
        
        return try validated(by: rule.validate)
        
    }
    
    public func validated<Rule: ValidationRule>(
        by rules: [Rule]
    )
    throws -> Self where Rule.Value == Self {
        
        return try rules.reduce(self) { currentValue, rule in
            
            return try currentValue.validated(by: rule)
            
        }
        
    }
    
}
