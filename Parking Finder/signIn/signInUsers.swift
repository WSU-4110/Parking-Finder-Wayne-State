//
//  signInUsers.swift
//  Parking Finder
//
//  Created by Server on 4/22/21.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

// Singleton design pattern
class signInUsers
{
    
    static let sharedInstance: signInUsers  = signInUsers()  // instance
    
    private init(){}        // prevent people from using default () initializer for this class
    
    public func signIn(email: String, password: String, onSuccess: @escaping () -> Void, onError: @escaping (_ errorMessage: String?) -> Void)
    {
        print("signin") // console log for debugging in xcode
        Auth.auth().signIn(withEmail: email, password: password) { (user: AuthDataResult?, error: Error?) in
            if error != nil
            {
                onError(error!.localizedDescription)
                return
            }
            onSuccess()
            print("login button tapped!") // console log for debugging in xcode
            let uid :String = (Auth.auth().currentUser?.uid)!
            print("Current user ID is: " + uid)
            print("current User Email is: ", user?.user.email! as Any) // print user's email to developer console for debugging
        }
    }

}
