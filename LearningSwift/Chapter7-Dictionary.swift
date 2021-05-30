//
//  Chapter7-Dictionary.swift
//  LearningSwift
//
//  Created by yao on 30/5/21.
//

import Foundation

// MARK: Dictionary
// creating dictionary
var namesAndScores = ["Anna": 2, "Brain": 2, "Craig": 8, "Donna": 6]
print(namesAndScores) // “["Craig": 8, "Anna": 2, "Donna": 6, "Brian": 2]”

namesAndScores = [:]
var pairs: [String: Int] = [:]
pairs.reserveCapacity(20)

// MARK: Accessing values
// using subscripting
namesAndScores = ["Anna": 2, "Brain": 2, "Craig": 8, "Donna": 6]
print(namesAndScores["Anna"]) // 2
print(namesAndScores["Greg"]) // nil and no error

// using properties and methods
namesAndScores.isEmpty // false
namesAndScores.count // 4

// modifying dictionary
// adding pairs
var bobData = {
    "name": "Bob",
    "profession": "Card Player",
    "country": "USA"
}
bobData.updateValue("CA", forKey: "state")
bobData["city"] = "San Francisco"

// updating values
bobData.updateValue("Bobby", forKey: "name") // Bob
bobData["profession"] = "Mailman"

// removing pairs
bobData.removeValue(forKey: "state")
bobData["city"] = nil

// iterating through dictionaries
for (player, score) in namesAndScores {
    print("\(player) - \(score)")
}
// > Craig - 8
// > Anna - 2
// > Donna - 6
// > Brian - 2

for player in namesAndScores.keys {
    print("\(player), ", terminator: "") // no newline
}
print("") // print one final newline
// > Craig, Anna, Donna, Brian,

//“Swift dictionaries have a type requirement for keys. Keys must be Hashable or you will get a compiler error.”


