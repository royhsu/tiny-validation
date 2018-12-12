//
//  CountError.swift
//  TinyValidation
//
//  Created by Roy Hsu on 2018/9/9.
//

// MARK: - CountError

public struct CountError: Error {

    public let range: ClosedRange<Int>

    public init(range: ClosedRange<Int>) { self.range = range }

}
