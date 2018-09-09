//
//  ValidationRule.swift
//  TinyValidation
//
//  Created by Roy Hsu on 2018/9/9.
//

// MARK: - ValidationRule

public protocol ValidationRule {
    
    associatedtype Value
    
    func validate(_ value: Value) throws -> Value
    
}
