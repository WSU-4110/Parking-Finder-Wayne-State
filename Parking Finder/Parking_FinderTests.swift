//
//  Parking_FinderTests.swift
//  Parking Finder
//
//  Created by Salem Baraka on 4/15/21.
//

import MapKit
import Foundation
@testable import Parking_Finder

class Parking_FinderTests: XCTestCase
{
    @IBOutlet weak var mapView: MKMapView!
    func test_viewDidLoad()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        mapView.delegate = self
        setZoomLevel(location: locationLatLong)
        self.placePins()
        func test_viewDidLoad()
    }
    
    func XCTAssertEqual(viewDidLoad : setZoomlevel);
    
    // Configure map starting coorndinates
    let locationLatLong = CLLocation(latitude: 42.354405249, longitude: -83.0687297251)                                                                 // initial start coordinates
    let distanceSpan: CLLocationDistance = 1500                                                                                                         // initial start radius distance
    func setZoomLevel(location: CLLocation)
    func test_setZoomLevel()    // create region for zoom level
    {
        let mapCoordinates = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: distanceSpan, longitudinalMeters: distanceSpan)
        mapView.setRegion(mapCoordinates, animated: true)
    }
    
    // structure for annotation pins
    struct ParkingZone{
    func test_ParkingZone()
    {
        var name: String
        var lattitude: CLLocationDegrees
        var longtitude: CLLocationDegrees
    }

        func XCTAssertNil(name:())
        func XCTAssertNil(lattitude:())
        func XCTAssertNil(longtitude:())
    
    
    let detailLabel = UILabel()

    
    func placePins()
    {
        // set each pin coordinate and name
        let wayneParkingZonesC = [ParkingZone(name: "1", lattitude: 42.35722, longtitude: -83.06361111),
                                 ParkingZone(name: "2", lattitude: 42.35689, longtitude: -83.06472222),
                                 ParkingZone(name: "3", lattitude: 42.35670, longtitude: -83.06530),
                                 ParkingZone(name: "4", lattitude: 42.35635, longtitude: -83.06611111),
                                 ParkingZone(name: "\"206\"", lattitude: 42.35605, longtitude: -83.06694444),
                                 ParkingZone(name: "\"206\"", lattitude: 42.35577, longtitude: -83.06777778),
                                 ParkingZone(name: "\"206\"", lattitude: 42.35559, longtitude: -83.06833333),
                                 ParkingZone(name: "\"206\"", lattitude: 42.35525, longtitude: -83.06944444),
                                 ParkingZone(name: "\"206\"", lattitude: 42.35515, longtitude: -83.06972222),
                                 ParkingZone(name: "\"206\"", lattitude: 42.35490, longtitude: -83.07055556),
                                 ParkingZone(name: "\"206\"", lattitude: 42.35455, longtitude: -83.07166667),
                                 ParkingZone(name: "\"206\"", lattitude: 42.35420, longtitude: -83.07277778),
                                 
                                 ParkingZone(name: "\"207\"", lattitude: 42.35445, longtitude: -83.06580),
                                 ParkingZone(name: "\"206\"", lattitude: 42.35390, longtitude: -83.06555556),
                                 ParkingZone(name: "\"206\"", lattitude: 42.35420, longtitude: -83.07277778)
        ]
        
        func test_wayneParkingZoneC()
        {
        // add each annotation parking zone with its info
        for ParkingZone in wayneParkingZonesC
        {
            let annotation = MKPointAnnotation()
            annotation.title = ParkingZone.name
            annotation.coordinate = CLLocationCoordinate2D(latitude: ParkingZone.lattitude, longitude: ParkingZone.longtitude)
            mapView.addAnnotation(annotation)
        }
    }

    
/*
var markerTintColor: UIColor
{
    switch annotation.title!!
    {
        case "Monument":
            return .red
        case "Mural":
            return .cyan
        case "Plaque":
            return .blue
        case "Sculpture":
            return .purple
        default:
            return .green
    }
}*/
func mapView(mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
{

    /*let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "MyMarker")                              // change colors code
    
    switch annotation.title
    {
        case "1":                                                               // add available func
            annotationView.markerTintColor = UIColor.green
        case "2":                                                                // add extended func
            annotationView.markerTintColor = UIColor.blue
        case "3":                                                                 // add full func
            annotationView.markerTintColor = UIColor.red
        default:                                                                   // if nothing than be grey
            annotationView.markerTintColor = UIColor.gray
    }*/
    func test_mapView()
    let annotationIdentifier = "MyMarker"
    var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)
    
    func test_annotationView()
    /*var image: UIImage
    {
      guard let name = discipline
    else
    {
        return #imageLiteral(resourceName: "Flag")
    }*/
    
    if annotationView == nil
    {
    XCTAssertNil(annotationView)
    {
        annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
        annotationView!.canShowCallout = true
        
        //let mapsButton = UIButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 48, height: 48)))
       // mapsButton.setBackgroundImage(#, for: .normal)
        
        annotationView!.annoDesign(arrangedSubviews: [UIButton(type: .detailDisclosure), UIButton(type: .detailDisclosure), UIButton(type: .detailDisclosure)])     // three added info buttons
    }
    
    
    else
        {
    {
        annotationView!.annotation = annotation
    }
    return annotationView
}
    
    func test_annotationView()
       {
           XCTAssertEqual(UIburron, canShowCallout)
       }
}



 MKAnnotationView
XCTAssertNil(MKAnnotationView)// design of annotation container
{

    func annoDesign(arrangedSubviews: [UIView])
    {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleBottomMargin, .flexibleWidth, .flexibleHeight]
        stackView.translatesAutoresizingMaskIntoConstraints = false
    
        func test_annoDesign()
        self.detailCalloutAccessoryView = stackView
    }
    func test_annoDesign()
    XCTAssertNil(annoDesign)
    
    
}

/*extension finderViewController
{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        let annotationIdentifier = "MyMarker"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)

        if annotationView == nil
        {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView!.canShowCallout = true
            annotationView!.annoDesign(arrangedSubviews: [UIButton(type: .detailDisclosure), UIButton(type: .detailDisclosure), UIButton(type: .detailDisclosure)])
        }
        else
        {
            annotationView!.annotation = annotation
        }
        return annotationView
    }
    
}*/


    
    
    
    

