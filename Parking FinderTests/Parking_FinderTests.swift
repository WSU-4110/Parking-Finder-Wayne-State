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
    var map: finderViewController!
    func Test_pins()
    {
        let map = finderViewController()            // class
        
        let locationLatLong = CLLocation(latitude: 42.354405249, longitude: -83.0687297251)     // result
        let testing = CLLocation(latitude: 42.354405249, longitude: -83.0687297251)             // result
     
        let _: () = map.setZoomLevel(location: CLLocation(latitude: 42.354405249, longitude: -83.0687297251))   //input
        XCTAssertEqual((testing),locationLatLong)
    }

}
