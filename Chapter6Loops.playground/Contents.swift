//: Playground - noun: a place where people can play

import Cocoa

/*
var myFirstInt: Int = 0

for i in 1...5
{
    myFirstInt += 1
    myFirstInt
    print("myFirstInt equals \(myFirstInt) at iteration \(i)")
}

for i in 1...100 where i % 3 == 0
{
    print(i)
}

var i = 1
while i <= 5
{
    myFirstInt += 1
    print(myFirstInt)
    i += 1
}
*/

/*
let range: Int = 100
for i in 0...range
{
    if(i % 3 == 0 && i % 5 == 0)
    {
        print("FIZZ BUZZ")
    }
    else if(i % 3 == 0)
    {
        print("FIZZ")
    }
    else if(i % 5 == 0)
    {
        print("BUZZ")
    }
    else
    {
        print(i)
    }
}
*/

let fizzBuzz = (fizz: 3, buzz: 5, fizzBuzz: 15)
let range: Int = 100

for i in 0...range
{
    switch i
    {
    case let unknownCode where unknownCode % fizzBuzz.fizzBuzz == 0:
        print("FIZZ BUZZ")
    case let unknownCode where unknownCode % fizzBuzz.fizz == 0:
        print("FIZZ")
    case let unknownCode where unknownCode % fizzBuzz.buzz == 0:
        print("BUZZ")
    
    default:
        print(i)
    }
}


