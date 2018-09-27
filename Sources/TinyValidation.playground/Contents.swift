import PlaygroundSupport
import TinyValidation

let email: String? = "helo@abc.com"

let a = try email.validated(
    by: [
        AnyValidationRule<String>(RequiredRule()),
        AnyValidationRule<String>(EmailRule.standard)
    ]
)

a

print("End")
