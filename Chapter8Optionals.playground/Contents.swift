//: Playground - noun: a place where people can play

import Cocoa

var errorCodeString: String?
errorCodeString = "404"

/*
if errorCodeString != nil
{
    let theError = errorCodeString! //! is similar Nullable.value.
    print(theError)
}
 */

/*
if let theError = errorCodeString, let errorCodeInteger = Int(theError), errorCodeInteger == 404
{
        print("\(theError): \(errorCodeInteger)")
}
 */

var errorDescription: String?
if let theError = errorCodeString, let errorCodeInteger = Int(theError), errorCodeInteger == 404
{
    errorDescription = "\(errorCodeInteger + 200): resource was not found."
}

var upCaseErrorDescription = errorDescription?.uppercased()
errorDescription

//If using !, it'll unwarp upCaseErrorDescription whether or not it is nil, so much safer to use ?
//? returns the value if it has something, nil if it does not.
upCaseErrorDescription?.append(" PLEASE TRY AGAIN.")
upCaseErrorDescription

/*
let description: String
if let errorDescription = errorDescription
{
    description = errorDescription
}
else
{
    description = "No error"
}
 */

// null coalescing operator.
let description = errorDescription ?? "No error"

let nilString: String?
nilString = nil

nilString?.uppercased()
