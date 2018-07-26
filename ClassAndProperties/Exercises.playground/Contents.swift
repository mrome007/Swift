//: ## Lesson 6 Exercises - Classes, Properties and Methods

import UIKit

//: __Problem 1__
//:
//: __1a.__
//: The compiler is complaining because the class Animal has no initializers. Write an init method for the Animal class and quiet this error. Include a mechanism to initialize the length of the Animal's tail using the Tail struct provided.
struct Tail {
    let lengthInCm: Double
}

class Animal {
    var species: String = ""
    let tail: Tail
    
    init() {
        tail = Tail(lengthInCm: 1)
    }
    
    init(type: String, tailLength: Double) {
        species = type
        tail = Tail(lengthInCm: tailLength)
    }
}
//: __1b.__
//: Instantiate and initialize a few different Animals.
let dog = Animal(type: "dog", tailLength: 100)
let cat = Animal(type: "cat", tailLength: 75)
//: __Problem 2__
//:
//: Below are the beginnings of the Peach class.
class Peach {
    let variety: String
    
    // Softness is rated on a scale from 1 to 5, with 5 being the softest
    var softness: Int
    
    static let varieties = ["White", "Yellow", "Donut"]
    
    init(variety: String, softness: Int) {
        self.variety = variety
        self.softness = softness
    }
    
    func ripen() -> String {
        softness += 1
        return softness > 5 ? "Peach is Ripe" : "Peach is not Ripe"
    }
}
//: __2a.__
//: Add a type property to the Peach class called "varieties". It should hold an array of different types of peaches.
//:
//: __2b.__
//: Add an instance method called ripen() that increases the value of the stored property, softness, and returns a string indicating whether the peach is ripe.
//:
//: __2c.__
//: Create an instance of the Peach class and call the method ripen().
let peach = Peach(variety: "Donut", softness: 2)
let ripe = peach.ripen()
//: __Problem 3__
//:
//: __3a.__
//:Add the computed property, "cuddlability", to the class, FluffyDog. Cuddlability should be computed based on the values of the stored properties, fluffiness and droolFactor.
class FluffyDog {
    let name: String
    let fluffiness: Int
    let droolFactor: Int
    var cuddlability: Int {
        return fluffiness - droolFactor
    }
    
    init(name: String, fluffiness: Int, droolFactor: Int) {
        self.name = name
        self.fluffiness = fluffiness
        self.droolFactor = droolFactor
    }
    
    func chase(_ wheeledVehicle: String)-> String {
        return "Where are you going, \(wheeledVehicle)? Wait for me! No, don't go! I will catch you!"
    }
}
//: __3b.__
//: Instantiate and initialize an instance of the class, FluffyDog. Use it to call the method, chase().
let fubu = FluffyDog(name: "Fubu", fluffiness: 10, droolFactor: 1)
let chase = fubu.chase("car")
//: __Problem 4__
//:
//: __4a.__
//: Write an instance method, bark(), that returns a different string based on the value of the stored property, size.
enum Size: Int {
    case small
    case medium
    case large
}

class ChattyDog {
    let name: String
    let breed: String
    let size: Size
    
    init(name: String, breed: String, size: Size) {
        self.name = name
        self.breed = breed
        self.size = size
    }
    
    func bark() -> String {
        var barkString = ""
        switch self.size {
        case .small:
            barkString = "aaarf"
        case .medium:
            barkString = "Arrf"
        case .large:
            barkString = "Rrruf"
        default:
            barkString = ""
        }
        return barkString
    }
    
    class func speak(size: Size) -> String {
        var barkString = ""
        switch size {
        case .small:
            barkString = "aaarf"
        case .medium:
            barkString = "Arrf"
        case .large:
            barkString = "Rrruf"
        default:
            barkString = ""
        }
        return barkString
    }
}
//: __4b.__
//: Create an instance of ChattyDog and use it to call the method, bark().
let chattyDog = ChattyDog(name: "Fubu", breed: "German Shepherd", size: Size.large)
let bark = chattyDog.bark()
//: __4c.__
//: Rewrite the method, bark(), as a type method and rename it speak(). Call your type method to test it out.
let speak = ChattyDog.speak(size: Size.medium)
//: __Problem 5__
//:
//:__5a.__
//: Write an initialization method for the House class below.
enum Quality {
    case poor, fair, good, excellent
}

enum NaturalDisaster {
    case earthquake
    case wildfire
    case hurricane
}

class House {
    var numberOfBedrooms: Int = 0
    let location: Quality
    
    var worthyOfAnOffer: Bool {
        return location == Quality.good && numberOfBedrooms == 2
    }
 
    init(numBedRooms: Int, quality: Quality) {
        self.numberOfBedrooms = numBedRooms
        self.location = quality
    }
    
    func willStayStanding(_ naturalDisaster:NaturalDisaster)-> Bool {
        switch naturalDisaster {
        case .earthquake:
            return true
        case .wildfire:
            return true
        case .hurricane:
            return false
        }
    }
}

//: __5b.__
//: Create an instance of the House class and use it to call the method, willStayStanding().  This method takes in a parameter of type NaturalDisaster and return a Bool indicating whether the house will stay standing in a given natural disaster.
let house = House(numBedRooms: 4, quality: Quality.excellent)
let willStayStanding = house.willStayStanding(NaturalDisaster.earthquake)
//: __5c.__
//: Add a computed property called, "worthyOfAnOffer". This property should be a Bool, whose return value is dependent upon some combination of the stored properties, numberOfBedrooms and location.






