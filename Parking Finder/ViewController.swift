//
//  ViewController.swift
//  Parking Finder
//
//  Created by Server on 2/7/21.
//
// (Home/Park Interface)

import UIKit
import FirebaseDatabase
import FirebaseAuth
import MapKit

class homeViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate
{

    
    // Outlets for text fields and button
    @IBOutlet weak var userParkedZoneField: UITextField!
    @IBOutlet weak var userParkedETimeField: UITextField!
    @IBOutlet weak var homeButton: UIButton!
    
    

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        userParkedZoneField.delegate = self
        userParkedETimeField.delegate = self
        
        
        
        // shadow for park button
        homeButton.layer.shadowColor = UIColor.black.cgColor
        homeButton.layer.shadowOffset = CGSize(width: 2, height: 3)
        homeButton.layer.shadowRadius = 1.0
        homeButton.layer.shadowOpacity = 1.5
        // code make i change colors - notifyUserOnline.textColor = UIColor.blue
    }
    

    
    //********************************************************
    //* Event method triggered by PARKED button being tapped.
    //* -Sends provided Parking Zone number and Time (in hours)
    //*     to the database.
    //********************************************************
    @IBAction func parkedButtonTapped(_ sender: Any) {
        print("parked button tapped!") // Write to console for debugging purposes
        let ref = Database.database().reference() // Define a reference to the database
        let usersReference = ref.child("users") // Define a reference to the users table
    
        
        let userRef = usersReference.child(Auth.auth().currentUser!.uid) // Get the current user that is logged in
        
        // Write user ID to console for debugging
        let uid :String = (Auth.auth().currentUser?.uid)!
        print("Current user ID is" + uid)
        
        // Set values in the user entity for the parking zone and the time interval
        userRef.updateChildValues([
            "parking Zone": self.userParkedZoneField.text!,
            "parking time":self.userParkedETimeField.text!
        ])
        print("action finished")
        
        // Parked Button is hidden when tapped
        let tapButton : UIButton = sender as! UIButton
            tapButton.isHidden = true;
    }
    
    
    // Func Handle textfields Home Page
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        // code that allows users to enter only numbers
        let allowedCharacters = "+1234567890"
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharacterSet = CharacterSet(charactersIn: string)
        
        // code that allows users to enter three numbers total
        let maxLength = 3
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        
        return allowedCharacterSet.isSuperset(of: typedCharacterSet) && newString.length <= maxLength
    }

    
    
    
    
    //keyboard methods for fields
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        hidekeyboardHome()
        return true
    }
    // Func hideKeyboard
    func hidekeyboardHome()
    {
        print("Hide Keyboard")
        userParkedZoneField.resignFirstResponder()
        userParkedETimeField.resignFirstResponder()
    }

    
}
class finderViewController: UIViewController
{

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
  
        getParkzonesOnMap(wayneParkingZones)
        setZoomLevel(location: locationLatLong)
        
    }
    
    
    
    
    
    // initial start coordinates
    let locationLatLong = CLLocation(latitude: 42.354405249, longitude: -83.0687297251)
    
    // initial start radius distance
    let distanceSpan: CLLocationDistance = 1500
    
    // create region for zoom level
    func setZoomLevel(location: CLLocation)
    {
        let mapCoordinates = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: distanceSpan, longitudinalMeters: distanceSpan)
        mapView.setRegion(mapCoordinates, animated: true)
    }

    
    
    
    
    
    // structure for annotation pins
    struct ParkingZone
    {
        var name: String
        var lattitude: CLLocationDegrees
        var longtitude: CLLocationDegrees
    }
    
    // set each pin coordinate and name
    let wayneParkingZones = [ParkingZone(name: "\"202\"", lattitude: 42.35722, longtitude: -83.06361111),
                             ParkingZone(name: "\"206\"", lattitude: 42.35689, longtitude: -83.06472222),
                             ParkingZone(name: "\"206\"", lattitude: 42.35670, longtitude: -83.06530),
                             ParkingZone(name: "\"206\"", lattitude: 42.35635, longtitude: -83.06611111),
                             ParkingZone(name: "\"206\"", lattitude: 42.35605, longtitude: -83.06694444),
                             ParkingZone(name: "\"206\"", lattitude: 42.35577, longtitude: -83.06777778),
                             ParkingZone(name: "\"206\"", lattitude: 42.35559, longtitude: -83.06833333),
                             ParkingZone(name: "\"206\"", lattitude: 42.35525, longtitude: -83.06944444),
                             ParkingZone(name: "\"206\"", lattitude: 42.35515, longtitude: -83.06972222),
                             ParkingZone(name: "\"206\"", lattitude: 42.35490, longtitude: -83.07055556),
                             ParkingZone(name: "\"206\"", lattitude: 42.35455, longtitude: -83.07166667),
                             ParkingZone(name: "\"206\"", lattitude: 42.35420, longtitude: -83.07277778),
                             
                             ParkingZone(name: "\"206\"", lattitude: 42.35445, longtitude: -83.06580),
                             ParkingZone(name: "\"206\"", lattitude: 42.35390, longtitude: -83.06555556),
                             ParkingZone(name: "\"206\"", lattitude: 42.35420, longtitude: -83.07277778)
    ]
    
    // add each annotation parking zone with its info
    func getParkzonesOnMap(_ wayneParkingZones: [ParkingZone])
    {
        for ParkingZone in wayneParkingZones
        {
            let annotations = MKPointAnnotation()
            annotations.title = ParkingZone.name
            annotations.coordinate = CLLocationCoordinate2D(latitude: ParkingZone.lattitude, longitude: ParkingZone.longtitude)
            mapView.addAnnotation(annotations)
            
        }
    }
    
    

}
