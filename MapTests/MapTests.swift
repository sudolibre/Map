//
//  MapTests.swift
//  MapTests
//
//  Created by Jonathon Day on 12/13/16.
//  Copyright © 2016 dayj. All rights reserved.
//

import XCTest
@testable import Map

class MapTests: XCTestCase {
    
    func testInt2Enum() {
    let result = int2Enum(intList: [1, 2, 3, 4]) //
    let expected = [Parity.odd, Parity.even, Parity.odd, Parity.even]
    XCTAssertEqual(result, expected)
    }
    
    func testCuber() {
    let result = cuber(intList: [1, 2, 3, 4])
    let expected = [1, 8, 27, 64]
    XCTAssertEqual(result, expected)
    }
    
    func testDessert() {
        let dictionary1: [String: String] = ["ice cream": "cherry"]
        let arrayOfDictionary1: [[String: String]] = [dictionary1]
        
        let result1 = dessert(inputArray: arrayOfDictionary1)
        let expected1: [[String: String]] = [["yogurt": "cherry"]]
        
        let dictionary2: [String: String] = ["toppings": "jimmies", "ice cream": "cherry"]
        let arrayOfDictionary2: [[String: String]] = [dictionary2]
        
        let result2 = dessert(inputArray: arrayOfDictionary2)
        let expected2: [[String: String]] = [["toppings": "sprinkles", "yogurt": "cherry"]]

        let dictionary3: [String: String] = ["yogurt": "strawberry"]
        let arrayOfDictionary3: [[String: String]] = [dictionary3]
        
        let result3 = dessert(inputArray: arrayOfDictionary3)
        let expected3: [[String: String]] = [["yogurt": "strawberry"]]
        
        XCTAssertEqual(result1[0], expected1[0])
        XCTAssertEqual(result2[0], expected2[0])
        XCTAssertEqual(result3[0], expected3[0])
        
        
    }
    
    func testAlphabetPlace() {
        let result1 = alphabetPlace(word: "cake")
        let expected1 = "2-0-10-4"
        let result2 = alphabetPlace(word: "candy")
        let expected2 = "2-0-13-3-24"
        let result3 = alphabetPlace(word: "cAke")
        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected1)
    }
    
    func testAlphabetPlaceWithPunctuation() {
        let result1 = alphabetPlaceWithPunctuation(word: "cake!")
        let expected1 = "2-0-10-4-!"
        
        let result2 = alphabetPlaceWithPunctuation(word: "candy!")
        let expected2 = "2-0-13-3-24-!"
        
        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
    }
    
    func testAlphabetPlaceRot13() {
        let result1 = alphabetPlaceRot13(word: "Cake!")
        let expected1 = "15-13-23-17-!"
        
        let result2 = alphabetPlaceRot13(word: "Candy!!1!")
        let expected2 = "15-13-0-16-11-!-!-1-!"
        
        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
    }
    
    func testAlphabetPlaceRot13P2() {
        let result = alphabetPlaceRot13P2(word: "I am 1337")
        let expected = "21- -13-25- -A-C-C-G"
        
        XCTAssertEqual(result, expected)
        
    }   

}
