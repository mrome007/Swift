//: Playground - noun: a place where people can play

import Cocoa

var movieRatings = ["Donnie Darko" : 4, "Chungking Express" : 5, "Dark City" : 4]
print("I have rated \(movieRatings.count) movies.")

let darkoRating = movieRatings["Donnie Darko"]
movieRatings["Dark City"] = 5
movieRatings

let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")
if let lastRating = oldRating, let currentRating = movieRatings["Donnie Darko"]
{
    print("Old rating: \(lastRating); current rating: \(currentRating)")
}

movieRatings["The Cabinet of Dr. Caligari"] = 5
movieRatings.removeValue(forKey: "Dark City")

for (key, value) in movieRatings
{
    print("The movie \(key) was rated \(value).")
}

for movie in movieRatings.keys
{
    print("User has rated \(movie).")
}

let watchedMovie = Array(movieRatings.keys)
