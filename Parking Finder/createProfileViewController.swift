//
//  createProfileViewController.swift
//  Parking Finder
//
//  Created by Server on 2/15/21.
//
import UIKit
import FirebaseDatabase

class createProfileViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate
{
    private let database = Database.database().reference()
    
    // Outlets
    @IBOutlet weak var userEmailField: UITextField!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var userPasswordField: UITextField!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        userEmailField.delegate = self
        userNameField.delegate = self
        userPasswordField.delegate = self
        

        
        database.child("Users").observeSingleEvent(of: .value, with: {snapshot in
        guard let value = snapshot.value as? [String: Any]
        else
        {
            return
        }
            print("Value: \(value)")
        })
        
        
    }
    
    // Action to send user create profile data to database
    @IBAction func createTapped(_ sender: Any)
    {
      
        let createProfileObject: [String: Any] =
        [
            "email":userEmailField.text!,
            "username":userNameField.text!,
            "password":userPasswordField.text!
        ]
        database.child("Users").childByAutoId().setValue(createProfileObject)
    }

    // (Trevor) I think this is done in this class? The addToDatabase function will be called by Fahim to update the database when the user submits their new profile 
    // information, passing the user's form inputs in the argument
    //

    //keyboard methods for fields
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        hidekeyboardProfile()
        return true
    }
    func hidekeyboardProfile()
    {
        print("Hide Keyboard")
        userEmailField.resignFirstResponder()
        userNameField.resignFirstResponder()
        userPasswordField.resignFirstResponder()
    }
    
    
    

}
