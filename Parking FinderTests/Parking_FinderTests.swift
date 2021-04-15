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
    
    func Test_mapView(_ mapView: MKMapView,  viewFor annotation: MKAnnotation )
    {
            let testing = "MyMarker"
        
            let annotationIdentifier = "MyMarker"
            let  _ = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)
        
        
        
             XCTAssertEqual((testing),annotationIdentifier)
        }
            

}

