//
//  Parking_FinderTests.swift
//  Parking FinderTests
//
//  Created by Server on 2/7/21.
//

import UIKit
import MapKit
import CoreData
import XCTest

@testable import Parking_Finder








class Parking_FinderTests: XCTestCase
{
    var mapView: MKMapView!
     func Testing_annoDesign(arrangedSubviews: [UIView])
    {
            let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
                stackView.axis = .horizontal
                stackView.distribution = .fillEqually
                stackView.alignment = .fill
                stackView.spacing = 5
                stackView.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleBottomMargin, .flexibleWidth, .flexibleHeight]
                stackView.translatesAutoresizingMaskIntoConstraints = false
            
                
                let detailCalloutAccessoryView = stackView
        
            XCTAssertNotNil(stackView)
        }
            

}

