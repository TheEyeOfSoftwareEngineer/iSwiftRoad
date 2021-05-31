//
//  Chapter9-Strings.swift
//  LearningSwift
//
//  Created by yao on 30/5/21.
//

import Foundation

// MARK: Strings as collections
let string = "Will"
for char in string {
    print(char)
}

let stringLength = string.count

let fourthChar = string[3]
//“subscript' is unavailable: cannot subscript String with an Int, see the documentation comment for discussion”

// MARK: Grapheme clusters
let cafeNormal = "cafe"
let cafeCombining = "cafe\u{0301}"

cafeNormal.count // 4
cafeCombining.count // 4

cafeNormal.unicodeScalars.count // 4
cafeCombining.unicodeScalars.count // 5

for codePoint in cafeCombining.unicodeScalars {
    print(codePoint.value)
}
// 99
// 97
// 102
// 101
// 769

// MARK: Indexing strings
let firstIndex = cafeCombining.startIndex
let firstChar = cafeCombining[firstIndex]

let lastIndex = cafeCombining.endIndex
let lastChar = cafeCombining[lastIndex] // Fatal error: String index is out of bounds

let lastIndex = cafeCombining.Index(before: cafeCombining.endIndex)
let lastChar = cafeCombining[lastIndex]

let fourthIndex = cafeCombining.index(cafeCombining.startIndex, offsetBy: 3)
let fourthChar = cafeCombining[fourthIndex]

fourthChar.unicodeScalars.count // 2
fourthChar.unicodeScalars.forEach { codePoint in
  print(codePoint.value)
}

// MARK: Strings as bi-directional collections
let name = "Will"
let backwardsName = name.reversed()

let secondCharIndex = backwardsName.index(backwardsName.startIndex,
                                          offsetBy: 1)
let secondChar = backwardsName[secondCharIndex] // "l"

// MARK: Raw strings
let raw2 = ##"Aren’t we "# clever"##
print(raw2) // Aren’t we "# clever

let can = "can do that too"
let raw3 = #"Yes we \#(can)!"#
print(raw3) // “Yes, we can do that too!”

// MARK: Substrings
let fullName = "Will Yao"
let spaceIndex = fullName.firstIndex(of: " ")
let firstName = fullName[fullName.startIndex..<spaceIndex] // "Will"

let firstName = fullName[..<spaceIndex] // "Will"
let lastName = fullName[fullName.index(after: spaceIndex)...]

let lastNameString = String(lastName)

// MARK: Character properties
let signleCharacter: Character = "x"
signleCharacter.isASCII

let space: Character = " "
space.isWhitespace // true



