//
//  Parking_FinderTests.swift
//  Parking FinderTests
//
//  Created by Server on 2/7/21.
//

import XCTest
import UIKit
import MapKit
import firebase

@testable import Parking_Finder






class Parking_FinderTests: XCTestCase
{
    
func Testing_parkedButtonTapped(_ sender: Any) {
    
        print("parked button tapped!")
        let ref = Database.database().reference()
        let usersReference = ref.child("users")

    
        let userRef = usersReference.child(Auth.auth().currentUser!.uid)
    
    
        let uid :String = (Auth.auth().currentUser?.uid)!
        print("Current user ID is: " + uid)
        userRef.updateChildValues(["parking Zone": self.userParkedZoneField.text!,"parking time":self.userParkedETimeField.text!])
    
        print("action finished")
   
        let tapButton : UIButton = sender as! UIButton
            tapButton.isHidden = true;
    
     XCTAssertNotNil((uid), usersReference)
    
    }

}


