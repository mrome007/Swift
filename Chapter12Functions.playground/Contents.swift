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
/*
func divisionDescriptionFor(numerator: Double, denominator: Double, withPunctuation punctuation: String = ".")
{
    print("\(numerator) divided by \(denominator) equals \(numerator / denominator)\(punctuation)")
}

divisionDescriptionFor(numerator: 9.0, denominator: 3.0)
divisionDescriptionFor(numerator: 10.0, denominator: 5.0, withPunctuation: "!")
*/

func divisionDescriptionFor(numerator: Double, denominator: Double, withPunctuation punctuation: String = ".") -> String
{
    return "\(numerator) divided by \(denominator) equals \(numerator / denominator)\(punctuation)"
}

print(divisionDescriptionFor(numerator: 10.0, denominator: 5.0, withPunctuation: "!"))

//similar to ref keyword in c# or pass by reference in c++ using &
var error = "The request failed:"
func appendErrorCode(_ code: Int, toErrorString errorString: inout String)
{
    if(code == 400)
    {
        errorString += " bad request."
    }
}

error
appendErrorCode(400, toErrorString: &error)
error

func sortedEvenOddNunbers(_ numbers: [Int]) -> (evens: [Int], odds: [Int])
{
    var evens = [Int]()
    var odds = [Int]()
    for number in numbers
    {
        if(number % 2 == 0)
        {
            evens.append(number)
        }
        else
        {
            odds.append(number)
        }
    }
    
    return (evens, odds)
}

let aBunchOfNumbers = [10, 1, 4, 3, 57, 43, 84, 27, 156, 111]
let theSortedNumber = sortedEvenOddNunbers(aBunchOfNumbers)
print("The even numbers are: \(theSortedNumber.evens); The odd numbers are: \(theSortedNumber.odds)")

func grabMiddleName(fromFullName name: (String, String?, String)) -> String?
{
    return name.1
}

let middleName = grabMiddleName(fromFullName: ("Matt", nil, "Mathias"))
if let midName = middleName
{
    print(midName)
}

func greetByMiddleName(fromFullName name: (first: String, middle: String?, last: String))
{
    guard let middleName = name.middle, middleName.count <= 4 else
    {
        print("Hey there!")
        return
    }
    print("Hey \(middleName)")
}

greetByMiddleName(fromFullName: ("Matt", "Dang", "Mathias"))

//can also use string.hasSuffix.
func siftBeans(fromGroceryList groceryList: [String]) ->(beans: [String], otherGroceries: [String])
{
    var beans = [String]()
    var otherGroceries = [String]()
    
    for grocery in groceryList
    {
        if let bean = grocery.range(of: "beans")
        {
            beans.append(grocery)
        }
        else
        {
            otherGroceries.append(grocery)
        }
    }
    
    return (beans, otherGroceries)
}

let result = siftBeans(fromGroceryList: ["green beans", "milk", "black beans", "pinto beans", "apples"])
result.beans == ["green beans", "black beans", "pinto beans"]
result.otherGroceries == ["milk", "apples"]
