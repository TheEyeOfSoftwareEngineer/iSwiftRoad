//
//  Chapter3-Challenges.swift
//  LearningSwift
//
//  Created by yao on 30/5/21.
//

import Foundation

// MARK: Find the error
let firstName = "Matt"

if firstName == "Matt" {
  let lastName = "Galloway"
} else if firstName == "Ray" {
  let lastName = "Wenderlich"
}
let fullName = firstName + " " + lastName // lastname: undefined

// MARK: Boolean challenge
let answer = true && true  // true
let answer = false || false // flase
let answer = (true && 1 != 2) || (4 > 3 && 100 < 1) // true
let answer = ((10 / 2) > 3) && ((10 % 2) == 0) // true

// MARK: Snakes and ladders


