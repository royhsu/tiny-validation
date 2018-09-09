//
//  Validatable.swift
//  TinyValidation
//
//  Created by Roy Hsu on 2018/9/9.
//

// MARK: - Validatable

public protocol Validatable {

    @discardableResult
    func validated(
        by validator: (Self) throws -> Self
    )
    rethrows -> Self

}

// MARK: - Default Implementation

public extension Validatable {

    @discardableResult
    public func validated(
        by validator: (Self) throws -> Self
    )
    rethrows -> Self { return try validator(self) }

}
