//
//  PasswordError.swift
//  TinyValidation Tests
//
//  Created by Roy Hsu on 2018/9/9.
//

// MARK: - PasswordError

internal enum PasswordError: Error {

    case minimumLength(Int)

    case maximumLength(Int)

}
