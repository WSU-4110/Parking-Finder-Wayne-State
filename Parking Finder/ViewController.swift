//
//  ViewController.swift
//  Parking Finder
//
//  Created by Server on 2/7/21.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import MapKit

class homeViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate
{

    
    // Outlets for text fields and button
    @IBOutlet weak var userParkedZoneField: UITextField!
    @IBOutlet weak var userParkedETimeField: UITextField!
    
    // outlet for home view
    @IBOutlet weak var homeView: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        userParkedZoneField.delegate = self
        userParkedETimeField.delegate = self
        
        // code make i change colors - notifyUserOnline.textColor = UIColor.blue
    }
    // Eli write code to naviagate user to login View controller, similar to didTapCreateProfileButton() but instead of button do the VIEW element that holds all elements
    
    
    
    
    // Fahim write code to naviagate user to create profile View controller, similar to didTapCreateProfileButton() but instead of button do the VIEW element that holds all elements
    
    
    
    @IBAction func homeButton(_ sender: Any)
    {
        
        

    }
    

    
    // Action to send user parked data to database where user is
  /*  @IBAction func parkedButton(_ sender: Any)
    {
      
            
            let ref = Database.database().reference()
            
            let usersReference = ref.child("users")
           // print(usersReference.description()) // print out database
            let uid = user!.user.uid                              // new firebase user object
            let newUserReference = usersReference.child(uid)        // new reference points to the new user object on firebase
            newUserReference.setValue([                         // get user information
                "email":self.userEmailField.text!,
                "username":self.userNameField.text!,
                "password":self.userPasswordField.text!,
                "parking Zone":"",
                "parking time":""
            ])
            print("description\(newUserReference.description())")   // absolute path for location of the user
        }
        // Parked Button is hidden when tapped
        let tapButton : UIButton = sender as! UIButton
            tapButton.isHidden = true;
    }*/
    
    

    
    
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

    let locationManager = CLLocationManager()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
  
        fetchStadiumsOnMap(wayneParkingZones)
        zoomLevel(location: locationLatLong)
    }
    

    let locationLatLong = CLLocation(latitude: 42.354405249, longitude: -83.0687297251)
    let distanceSpan: CLLocationDistance = 2500
    
    func zoomLevel(location: CLLocation)
    {
        let mapCoordinates = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: distanceSpan, longitudinalMeters: distanceSpan)
        mapView.setRegion(mapCoordinates, animated: true)
    }

    struct ParkingZone
    {
        var name: String
        var lattitude: CLLocationDegrees
        var longtitude: CLLocationDegrees
    }
    
    let wayneParkingZones = [ParkingZone(name: "\"202\"", lattitude: 42.35722, longtitude: -83.06361111),
                             ParkingZone(name: "\"206\"", lattitude: 42.35689, longtitude: -83.06472222),
                             ParkingZone(name: "\"206\"", lattitude: 42.35670, longtitude: -83.06530),
                             ParkingZone(name: "\"206\"", lattitude: 42.35635, longtitude: -83.06611111),
                             ParkingZone(name: "\"206\"", lattitude: 42.35605, longtitude: -83.06694444),
                             ParkingZone(name: "\"206\"", lattitude: 42.35577, longtitude: -83.06777778),
                             ParkingZone(name: "\"206\"", lattitude: 42.35559, longtitude: -83.06833333),
                             ParkingZone(name: "\"206\"", lattitude: 42.35525, longtitude: -83.06944444),
                             ParkingZone(name: "\"206\"", lattitude: 42.35500, longtitude: -83.06972222)
    
    
    
    ]
    
    
    func fetchStadiumsOnMap(_ wayneParkingZones: [ParkingZone])
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
