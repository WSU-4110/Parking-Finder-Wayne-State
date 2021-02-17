//
//  createProfileViewController.swift
//  Parking Finder
//
//  Created by Server on 2/15/21.
//

import UIKit
import FirebaseDatabase

class createProfileViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    // (Trevor) I think this is done in this class? This function will be called by Fahim to update the database when the user submits their new profile 
    // information, passing their 
    //  

    func addToDatabase(string firstName, string lastName, string userEmail, string userName, bool isOnline, string password)
    {
        let ref = Database.database().reference()
        ref.child("users").childByAutoId().setValue([
            "firstName": firstName,
            "lastName": lastName,
            "userEmail": userEmail,
            "userName": userName,
            "isOnline", isOnline,
            "password", password
        ])
    }

}
