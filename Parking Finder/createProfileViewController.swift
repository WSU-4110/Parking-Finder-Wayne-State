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
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var userPasswordField: UITextField!
  

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        userNameField.delegate = self
        userPasswordField.delegate = self
        
        
        
        /*database.child("Users").observeSingleEvent(of: .value, with: {snapshot in
        guard let value = snapshot.value as? [String: Any]
        else
        {
            return
        }
            print("Value: \(value)")
        })
         
        
        let createUserButton = UIButton(frame: CGRect(x: 20, y: 400, width: view.frame.size.width-40, height:50))
        createUserButton.setTitle("Create Profile", for: .normal)
        createUserButton.setTitleColor(.white, for: .normal)
        createUserButton.backgroundColor = .link
        view.addSubview(createUserButton)
        createUserButton.addTarget(self, action: #selector(addNewUser), for:.touchUpInside)*/
        
    }
        
    @IBAction func createTapped(_ sender: Any)
    {
      
        let userObject: [String: Any] =
        [
            "password":userPasswordField!.text,
            "username":userNameField!.text
        ]
        database.child("Users").childByAutoId().setValue(userObject)
    }

    // (Trevor) I think this is done in this class? The addToDatabase function will be called by Fahim to update the database when the user submits their new profile 
    // information, passing the user's form inputs in the argument
    //


  /*  @objc private func addNewUser()
    {
        let userObject: [String: Any] =
        [
            "password":"" as NSObject,
            "username":""
        ]
        database.child("Users").childByAutoId().setValue(userObject)
    }*/

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
      
        userPasswordField.resignFirstResponder()
    }
}
/*extension createProfileViewController : UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) ->Bool
    {
        textField.resignFirstResponder()
        return true
    }
}*/
