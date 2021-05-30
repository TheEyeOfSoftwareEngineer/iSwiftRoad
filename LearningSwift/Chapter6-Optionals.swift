//
//  Chapter6-Optionals.swift
//  LearningSwift
//
//  Created by yao on 30/5/21.
//

import Foundation

// MARK: Introducing nil
var name = "Will"
var age = 26
var occupation = "Developer"

// Sentimal values
//“A value that represents a special condition such as the absence of a value is known as a sentinel value, or simply, special value. ”
var errorCode = 0

// Introduing optionals
var errorCOde: Int?

errorCode = 100
errorCode = nil

// MARK: Unwarpping optionals
var  result: Int? = 30
print(result) // Optional(30)
print(result + 1) // error: “Value of optional type 'Int?' must be unwrapped to a value of type 'Int”

// MARK: Force unwarpping
var authorName: String? = "Will"
var authorAge: Int? = 26

var unwarppingAuthorName = authorName!
print("Author is \(unwarppingAuthorName)")

authorName = nil
print("Author is \(authorName)") // error: “Fatal error: Unexpectedly found nil while unwrapping an Optional value"

if authorName != nil {
    print("Author is \(authorName)")
} else {
    print("No author.")
}

// MARK: Optional binding
if let unwarppingAuthorName = authorName {
    print("Author is \(unwarppingAuthorName)")
} else {
    print("No author.")
}

if let authorName = authorName {
    print("Author is \(authorName)")
} else {
    print("No result.")
}

if let authorName = authorName,
   authorAge = authorAge {
    print("The author is \(authorName) who is \(authorAge) years old")
} else {
    print("No author or no age")
}

if let authorName = authorName,
   authorAge = authorAge,
   authorAge >= 40 {
    print("The author is \(authorName) who is \(authorAge) years old")
} else {
    print("No author or no age")
}

// MARK: Introducing guard
func guardMyCastle(name: String) {
    guard let castleName = name else {
        print("No castle.")
        return
    }
    // At this point, 'castleName' is a non-optional String
    print("Your castle called \(castleName) was guarded")
}

func calculateNumberOfSides(shape: String) -> Int? {
    switch shape {
    case "Triangle":
        return 3
    case "Square":
        return 4
    case "Rectangle":
        return 4
    case "Pentagon":
        return 5
    case "Hexagon":
        return 6
    default:
        return nil
    }
}

func maybePrintSides(shape: String) {
  let sides = calculateNumberOfSides(shape: shape)

  if let sides = sides {
    print("A \(shape) has \(sides) sides.")
  } else {
    print("I don’t know the number of sides for \(shape).")
  }
}

func maybePrintSides(shape: String) {
  guard let sides = calculateNumberOfSides(shape: shape) else {
    print("I don’t know the number of sides for \(shape).")
    return
  }

  print("A \(shape) has \(sides) sides.")
}

// Nil coalescing
var optionalInt: Int? = 10
var mustHaveResult = optionalInt ?? 0

var optionalInt: Int? = 10
var mustHaveResult: Int
if let unwarpped = optionalInt {
    mustHaveResult = unwarpped
} else {
    mustHaveResult = 0
}

optionalInt = nil
mustHaveResult = optionalInt ?? 0
