//
//  Chapter7-ArrayDictionarySets.swift
//  LearningSwift
//
//  Created by yao on 30/5/21.
//

import Foundation

// MARK: Arrays
// creating arrays
let evenNumber = [2, 4, 6, 8]
var subscribers: [String] = []
let allZeros = Array(repeating: 0, count: 5) // [0, 0, 0, 0, 0]
let vowels = ["A", "E", "I", "O", "U"]

// accessing elements
// using properties and methods
var players = ["Alice", "Bob", "Cindy", "Dan"]
print(players.isEmpty) // false

if players.count < 2 {
    print("We need at least two players!")
} else {
    print("Let's start")
}

var currentPlayer = players.first
print(currentPlayer as Any) // Optional("Alice")
print(players.last as Any) // Optional("Dan")

currentPlayer = players.min()
print(currentPlayer as Any) // Optional("Alice")

print([2,3,1].first as Any) // Optional(2)
print([2,3,1].min() as Any) // Optional(1)

if let currentPlayer = currentPlayer {
    print("\(currentPlayer) will start")
}

// MARK: using subscripting
var firstPlayer = players[0]
print("First player is \(firstPlayer)")

var player = players[4] // fatal error: Index out of range

// MARK: using countable ranges to make an ArraySlice
// it acts like the Go slice
let upcomingPlayersSlice = players[1...2]
print(upcomingPlayersSlice[1], upcomingPlayersSlice[2]) // "Bob Cindy\n"

let upcomingPlayersSlice = Array(players[1...2])
print(upcomingPlayersSlice[0], upcomingPlayersSlice[1]) // "Bob Cindy\n"

// Checking for an element
func isEliminated(player: String) -> Bool {
    !players.contains(player)
}

print(isEliminated(player: "Bob")) // false
players[1...3].contains("Bob") // true

// MARK: modifying arrays
// appending elements
players.append("Eli")

player += ["Gina"]
print(players) // “["Alice", "Bob", "Cindy", "Dan", "Eli", "Gina"]”

// inserting elements
players.insert("Frank", at: 5) // “["Alice", "Bob", "Cindy", "Dan", "Eli", "Frank", "Gina"]”

// moving elements
var removedPlayer = players.removeLast()
print("\(removedPlayer) was removed") // "Gina was removed"

removedPlayer = players.remove(at: 2)
print("\(removedPlayer) was removed") // Cindy was removed

// updating elements
print(players)  // “["Alice", "Bob", "Dan", "Eli", "Frank"]”
players[4] = "Franklin"
print(players)  // “["Alice", "Bob", "Dan", "Eli", "Franklin"]”

player[0...1] = ["Donna", "Craig", "Brain", "Anna"]
print(players)  // “["Donna", "Craig", "Brain", "Anna", "Dan", "Eli", "Franklin"]”

// moving elements
let playerAnna = players.remove(at: 3)
players.insert(playerAnna, at: 0)
print(players)  // “["Anna", "Donna", "Craig", "Brain", "Dan", "Eli", "Franklin"]”

players.swap(1, 3)
print(players)  // “["Anna", "Brain", "Craig", "Donna", "Dan", "Eli", "Franklin"]”

players.sort()
print(players)  // “["Anna", "Brain", "Craig", "Donna", "Dan", "Eli", "Franklin"]”


// MARK: Iterating through an array
let scores = [2, 2, 8, 6, 1, 2, 1]
for player in players {
    print(player)
}
// Anna
// Brain
// Craig
// Donna
// Dan
// Eli
// Franklin

for (index, player) in players.enumerated() {
    print("\(index + 1). \(player)")
}
// 1. Anna
// 2. Brain
// 3. Craig
// 4. Donna
// 5. Dan
// 6. Eli
// 7. Franklin

func sumOfElement(in array: [int]) -> Int {
    var sum = 0
    for number in array {
        sum += number
    }
    return sum
}
print(sumOfElement(in: scores)) // 22

