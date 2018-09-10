# TinyValidation

[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/TinyValidation.svg)](https://cocoapods.org)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![Platform](https://img.shields.io/cocoapods/p/TinyComponent.svg?style=flat)

A fluent and elegant validation framework for Swift.

## Requirements

- iOS 8.0+
- Xcode 10.0+
- Swift 4.0+

## Installation

You can install TinyValidation using CocoaPods or Carthage.

### CocoaPods

```
use_frameworks!

pod 'TinyValidation'
```

### Carthage

```
github 'royhsu/TinyValidation'
```
## How to Use

Please make sure to import the framework.

```
import TinyValidation
```

### Built-in Validation Rules

You can use the built-in rules for trivial validations.

Example: Validate an email.

```swift
let validEmail = try "hello@example.com".validated(by: EmailRule.standard)

```

Currently supported rules.

* Email

### Custom Validation Rules

Create your custom rules by conforming to `ValidationRule` protocol.

Example: Validate a password.

```swift
// Custom password rules.
enum PasswordRule: ValidationRule {

    case minimumLength(Int)

    case maximumLength(Int)

    @discardableResult
    func validate(_ value: String) throws -> String {

        switch self {

        case let .minimumLength(length):

            if value.count < length { throw PasswordError.minimumLength(length) }

            return value

        case let .maximumLength(length):

            if value.count > length { throw PasswordError.maximumLength(length) }

            return value

        }

    }

}
```

Then you can validate multiple rules at once.

```swift
let passwordRules: [PasswordRule] = [
    .minimumLength(8),
    .maximumLength(10)
]

let validPassword = try "12345678".validated(by: passwordRules)

```

## Reference

- [Validator](https://github.com/adamwaite/Validator)
