//
//  ViewController.swift
//  Parking Finder
//
//  Created by Server on 2/7/21.
//

import UIKit
import FirebaseDatabase

class homeViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate{
    private let database = Database.database().reference()
    
    // Outlets for text fields and button
    @IBOutlet weak var userParkedZoneField: UITextField!
    @IBOutlet weak var userParkedETimeField: UITextField!
    
    // Label that is red and will be green when user online
    @IBOutlet weak var notifyUserOnline: UILabel!
    
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        userParkedZoneField.delegate = self
        userParkedETimeField.delegate = self
        
        // code make i change colors - notifyUserOnline.textColor = UIColor.blue
    }
    // Eli write code to naviagate user to login View controller, similar to didTapCreateProfileButton() but instead of button do the VIEW element that holds all elements
    
    
    
    
    // Fahim write code to naviagate user to create profile View controller, similar to didTapCreateProfileButton() but instead of button do the VIEW element that holds all elements
    
    
    
    
    
    // Action to send user parked data to database where user is
    @IBAction func parkedButton(_ sender: Any) {
        let createProfileObject: [String: Any] =
        [
            "parkingZone":userParkedZoneField.text!,
            "parkingET":userParkedETimeField.text!
        ]
        database.child("Users").childByAutoId().setValue(createProfileObject)
        
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
class accountViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    @IBAction func didTapCreateProfileButton()
    {
        guard let vc = storyboard?.instantiateViewController(identifier: "createProfile_vc") as? createProfileViewController
        else
        {
            return
        }
        present(vc, animated: true)
    }
    @IBAction func didTaploginProfileButton()
    {
        guard let vc = storyboard?.instantiateViewController(identifier: "loginProfile_vc") as? loginViewController
        else
        {
            return
        }
        present(vc, animated: true)
    }
}
class finderViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

}
