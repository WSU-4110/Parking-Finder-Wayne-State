//
//  Parking_FinderTests.swift
//  Parking FinderTests
//
//  Created by Server on 2/7/21.
//
import XCTest
import CoreData
import UIKit
import MapKit
@testable import Parking_Finder

class Parking_FinderTests: XCTestCase
{
    var keyboard: homeViewController!
    var parkedZone: UITextField!
    var parkedTime: UITextField!

    func test_keyboard_Numbers()
    {
        let allowedCharacters = "+1234567890"
        XCTAssertTrue(allowedCharacters.count == 11)
        let maxLength = 3
        XCTAssertTrue(maxLength == 3)
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        XCTAssertEqual(allowedCharacterSet,typedCharacterSet)
        
        let newSet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
        
        XCTAssertNotNil(newSet)
    }
}
