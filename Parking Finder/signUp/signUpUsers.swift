//
//  signUpUsers.swift
//  Parking Finder
//
//  Created by Server on 3/19/21.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

// singleton design pattern
class signUpUsers
{
    
    static let sharedInstance: signUpUsers  = signUpUsers()  // instance
    
    private init(){}        // prevent people from using default () initializer for this class
    
    public func fetchNewUser(username: String, email: String, password: String, completion: @escaping () -> Void, onError: @escaping (_ errorMessage: String?) -> Void)         //method
    {
            Auth.auth().createUser(withEmail: email, password: password) { (user: AuthDataResult?, error: Error?) in  // Authentificate users and create ID for them
            if error != nil
            {
                onError(error!.localizedDescription)
                return
            }
            let ref = Database.database().reference() // property
            let usersReference = ref.child("users")
            let uid = user!.user.uid                              // new firebase user object
            let newUserReference = usersReference.child(uid)        // new reference points to the new user object on firebase
            
            newUserReference.setValue([                         // get user information
                "email":email,
                "username":username,
                "password":password,
                "parking Zone":"",
                "parking time":""
            ])
            completion()
            print("New User created")
            print("Description: \(newUserReference.description())")   // absolute path for location of the user
            print("Create User button tapped!")
            print("New user ID is: " + uid)
        }
    }
}
