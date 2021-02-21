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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        userParkedZoneField.delegate = self
        userParkedETimeField.delegate = self
        
    }

    // Action to send user parked data to database where user is
    @IBAction func parkedButton(_ sender: Any) {
        let createProfileObject: [String: Any] =
        [
            "parkingZone":userParkedZoneField.text!,
            "parkingET":userParkedETimeField.text!
        ]
        database.child("Users").childByAutoId().setValue(createProfileObject)
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
