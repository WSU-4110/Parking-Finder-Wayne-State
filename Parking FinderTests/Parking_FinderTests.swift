//
//  Parking_FinderTests.swift
//  Parking FinderTests
//
//  Created by Server on 2/7/21.
//

import XCTest
import UIKit
import CoreData
import Firebase


@testable import Parking_Finder

class homeViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate
{
    
    
    
func Testing_viewDidLoad()
{
    
    
    
    super.viewDidLoad()
    
    let userParkedZoneField;.delegate = self
    let userParkedETimeField;.delegate = self
    
    
    // shadow for park button
    let homeButton;.layer.shadowColor = UIColor.black.cgColor
    let homeButton;.layer.shadowOffset = CGSize(width: 2, height: 3)
    let homeButton;.layer.shadowRadius = 1.0
    let homeButton;.layer.shadowOpacity = 1.5
    
    
     XCTAssertNotNil(viewDidLoad)
}
    
}

