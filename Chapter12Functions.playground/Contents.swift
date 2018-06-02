//: Playground - noun: a place where people can play

import Cocoa

func printGreeting()
{
    print("Hello, playground")
}

printGreeting()

/*
func printPersonalGreeting(name: String)
{
    print("Hello \(name), welcome to your playground")
}
*/

/*
func printPersonalGreeting(to name: String)
{
    print("Hello \(name), welcome to your playground.")
}

printPersonalGreeting(to: "Michael")
 */

//Just like params.
func printPersonalGreetings(to names: String...)
{
    for name in names
    {
        print("Hello \(name), welcome to the playground.")
    }
}

printPersonalGreetings(to: "Alex", "Chris", "Drew", "Pat")

/*
func divisionDescriptionFor(numerator: Double, denominator: Double)
{
    print("\(numerator) divided by \(denominator) equals \(numerator / denominator)")
}

divisionDescriptionFor(numerator: 9.0, denominator: 3.0)
*/

func divisionDescriptionFor(numerator: Double, denominator: Double, withPunctuation punctuation: String = ".")
{
    print("\(numerator) divided by \(denominator) equals \(numerator / denominator)\(punctuation)")
}

divisionDescriptionFor(numerator: 9.0, denominator: 3.0)
divisionDescriptionFor(numerator: 10.0, denominator: 5.0, withPunctuation: "!")
