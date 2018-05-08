//: Playground - noun: a place where people can play

import Cocoa

var population: Int = 1000
var message: String
var hasPostOffice: Bool = true

if population < 10000
{
    message = "\(population) is a small town!"
}
else if population >= 10000 && population < 50000
{
    message = "\(population) is a medium town"
}
else if population >= 500000
{
    message = "\(population) is pretty big!"
}
else
{
    message = "\(population) is ok"
}

print(message)

// === operator Evaluates whether the two instances point to the same reference.
// !=== operator Evaluates whether the two instances do not point to the same reference.

if !hasPostOffice
{
    print("Where do we buy stamps")
}

//when assigning a variable an if/else if needs an else block or it'll error.
