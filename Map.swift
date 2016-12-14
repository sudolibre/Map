//
//  Map.swift
//  Map
//
//  Created by Jonathon Day on 12/13/16.
//  Copyright © 2016 dayj. All rights reserved.
//

import Foundation

enum Parity {
    case even, odd
}
func int2Enum(intList: [Int]) -> [Parity] {
    let parityList: [Parity] = intList.map { if $0 % 2 == 0 {
        return Parity.even
    } else {
        return Parity.odd
        }}
    return parityList
}



// rubix
//
// Write a function which takes a list of integers and returns a list of their cubes
//
// input: [1, 2, 3, 4] output: [1, 8, 27, 64]

func cuber(intList: [Int]) -> [Int] {
    let cubedList = intList.map { $0*$0*$0 }
    return cubedList
}



//dessert
//
//Write a method, dessert that accepts [[String: String]] and changes the values associated with keys in the following ways: if the key "ice cream" has a value, remove the key and associate the value with the new key "yogurt". If the key "toppings" has the value "jimmies", change that value to "sprinkles".
//
//[[“ice cream": "cherry”]] -> [[“yogurt": "cherry"]]
//
//[[“toppings": "jimmies", "ice cream": "cherry”]] -> [["toppings": "sprinkles", "yogurt": "cherry”]]
//
//[[“yogurt": "strawberry”]] -> [[“yogurt": "strawberry”]]


func dessert(inputArray: [[String: String]]) -> [[String: String]] {
    let newArrayOfDictionaries: [[String: String]] =  inputArray.map { dictionary in
        var newDictionary = dictionary
        if let kvpValue = newDictionary["ice cream"] {
            print(kvpValue)
            newDictionary.updateValue(kvpValue, forKey: "yogurt")
            newDictionary.removeValue(forKey: "ice cream")
        }
        if newDictionary["toppings"] != nil {
            newDictionary.updateValue("sprinkles", forKey: "toppings")
        }
        return newDictionary
    }
    return newArrayOfDictionaries
}

// rotZeroNoPunctuation
//
// Write a function which takes in a string and returns a “-“ separated list of numbers where each number represents the place of the given character in the english alphabet. input will consist only of lower case characters.
//



func alphabetPlace(word: String) -> String {
    let alphabet = Array("abcdefghijklmnopqrstuvwxyz".characters)
    return word.lowercased().characters.map { String(describing: alphabet.index(of: $0)!) }.joined(separator: "-")
}

//
// rotZero
//
// Write a function which takes in a string and returns a “-“ separated list of numbers where each number represents the place of the given character in the english alphabet. input will consist only of lower case, upper case characters and punctuation. Punctuation (anything other than lower case characters) should be left alone. You are not expected to preserve case. 

func alphabetPlaceWithPunctuation(word: String) -> String {
    let alphabet = Array("abcdefghijklmnopqrstuvwxyz".characters)
    return word.lowercased().characters.map {
        if let index = alphabet.index(of: $0) {
            return String(describing: index)
        } else {
            return String($0)
        }}.joined(separator: "-")
}



//Write a function which takes in a string and returns a “-“ separated list of numbers where each number represents the place of the given character in the english alphabet with their number ‘rotated’ by 13. input will consist only of lower case, upper case characters and punctuation. Punctuation (anything other than lower case characters) should be left alone. You are not expected to preserve case. 
func alphabetPlaceRot13(word: String) -> String {
    let alphabet = Array("abcdefghijklmnopqrstuvwxyz".characters)
    return word.lowercased().characters.map {
        if let index = alphabet.index(of: $0) {
            var rotIndex = index + 13
            if rotIndex >= 26 {
                rotIndex %= 26
            }
            return String(describing: rotIndex)
        } else {
            return String($0)
        }}.joined(separator: "-")
}





//rot13 p 2
//
//Note that rot13Lossy preserves the 1 passed into it. This will lead to problems when converting back from the cypher. write a new version rot13 which will change each digit of any number into a corresponding upper case character. 

func alphabetPlaceRot13P2(word: String) -> String {
    let alphabet = Array("abcdefghijklmnopqrstuvwxyz".characters)
    let numSet = Set("0123456789".characters)
    return word.lowercased().characters.map {
        if let index = alphabet.index(of: $0) {
            var rotIndex = index + 13
            if rotIndex >= 26 {
                rotIndex %= 26
            }
            return String(describing: rotIndex)
        } else {
            if numSet.contains($0) {
                let rotIndex = (Int(String($0))! - 1)
                return String(alphabet[rotIndex]).uppercased()
            } else {
                return String($0)
            }
        }}.joined(separator: "-")
}

