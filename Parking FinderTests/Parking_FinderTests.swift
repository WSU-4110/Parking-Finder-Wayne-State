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
    var login: loginViewController!
    var userEmail: UITextField!
    var userPassword: UITextField!
    var loginButton: UIButton!
    

    
    func test_textField_Empty()
    {

        XCTAssertNil(userEmail)             // field start off no input so should be nil
        XCTAssertNil(userPassword)
        let both = (userEmail , userPassword)
        if both == nil
        {
            XCTAssertFalse(login.loginButton.isEnabled == false)
        }

 
    }
    func test_textField_Used()
    {

        let userEmail = "hithere"
        XCTAssertNotNil(userEmail)             // field has input so should not be nil
        let userPassword = "123456789"
        XCTAssertNotNil(userPassword)
   
        
        let both = (userEmail , userPassword)
        if both == nil
        {
            XCTAssertTrue(login.loginButton.isEnabled == false)
        }
     

    }
}
