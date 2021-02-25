//
//  createProfileViewController.swift
//  Parking Finder
//
//  Created by Server on 2/15/21.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class createProfileViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate
{
    
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
        

      /*
        database.child("Users").observeSingleEvent(of: .value, with: {snapshot in
        guard let value = snapshot.value as? [String: Any]
        else
        {
            return
        }
            print("Value: \(value)")
        })*/
        
        
    }
    
    
    
    @IBAction func createUserButton(_ sender: Any)
    {
        Auth.auth().createUser(withEmail: userEmailField.text!, password: userPasswordField.text!) { (user: AuthDataResult?, error: Error?) in  // Authentificate users and create ID for them
            if error != nil
            {
                print(error!.localizedDescription)
                return
            }
            
            let ref = Database.database().reference()
            
            let usersReference = ref.child("users")
           // print(usersReference.description()) // print out database
            let uid = user!.user.uid                              // new firebase user object
            let newUserReference = usersReference.child(uid)        // new reference points to the new user object on firebase
            newUserReference.setValue([                         // get user information
                "email":self.userEmailField.text!,
                "username":self.userNameField.text!,
                "password":self.userPasswordField.text!
            ])
            print("description\(newUserReference.description())")   // absolute path for location of the user
        }
    }
    
    
    // Action to send user create profile data to database
   /* @IBAction func createTapped(_ sender: Any)
    {
      
        let createProfileObject: [String: Any] =
        [
           
            
            "email":userEmailField.text!,
            "username":userNameField.text!,
            "password":userPasswordField.text!
        ]
        database.child("Users").childByAutoId().setValue(createProfileObject)
        
        // Create Profile Button is hidden when tapped
        let tapButton : UIButton = sender as! UIButton
            tapButton.isHidden = true;
    }*/

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
