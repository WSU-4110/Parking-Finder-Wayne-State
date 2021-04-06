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
    

    func test_hide_keyboard()
    {
        XCTAssertEqual(parkedZone,parkedTime)
    }
    func test_text_Field()
    {
        XCTAssertNil(parkedZone)
        XCTAssertNil(parkedTime)
    }
}
