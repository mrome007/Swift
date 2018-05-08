//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

print("The maximum Int value is \(Int.max)")
print("The minimum Int value is \(Int.min)")

print("The maximum 32-bit integer value is \(Int32.max)")
print("The minimum 32-bit integer value is \(Int32.min)")

print("The maximum UInt value is \(UInt.max).")
print("The minimum UInt value is \(UInt.min).")

let numberOfPages: Int = 10 //explicit
let numberOfChapter = 3 //implicit

let numberOfPeople: UInt = 40
let volumeAdjustment: Int32 = -1000

print(10 + 20)
print(30 - 5)
print(5 * 6)

var x = 10
x += 5
x -= 5

//OVERFLOW OPERATOR
let y: Int8 = 120
let z = y &+ 10

print("\(z)")
