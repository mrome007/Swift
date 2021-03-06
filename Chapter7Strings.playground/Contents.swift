//: Playground - noun: a place where people can play

import Cocoa

let playground = "Hello, playground"
var mutablePlayground = "Hello, mutable playground"
mutablePlayground += "!"

for c: Character in mutablePlayground.characters
{
    print("'\(c)'")
}

let oneCoolDude = "\u{1F60E}"
let aAcute = "\u{0061}\u{0301}"

for scalar in playground.unicodeScalars
{
    print("\(scalar.value) ")
}

let aAcutePrecomposed = "\u{00E1}"

let b = aAcute == aAcutePrecomposed
print("aAcute: \(aAcute.count); aAcutePrecomposed: \(aAcutePrecomposed.count)")

//Swift does not let accessing of chars with int. playground[0] is a no no.
//Finding the fifth character

/*
let start = playground.startIndex
let end = playground.index(start, offsetBy: 4)
let fifthCharacter = playground[end]
*/

//substring equivalent
let start = playground.startIndex
let end = playground.index(start, offsetBy: 4)
let fifthCharacter = playground[end]
let range = start...end
let firstFive = playground[range]

let empty = ""
let emptyStart = empty.startIndex
let emptyEnd = empty.endIndex
let isEmpty1 = emptyStart == emptyEnd
let isEmpty2 = empty.isEmpty

let helloUnicode = "\u{0048}\u{0065}\u{006C}\u{006C}\u{006F}"
