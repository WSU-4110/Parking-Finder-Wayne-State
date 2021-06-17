//
//  AuthService.swift
//  Parking Finder
//  
//  Singleton responsible for communicating with firebase for user functionality
//  Created by Server on 3/11/21.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class AuthService
{
    // Internal method that signs the user's account into the app when called
    // Arguments: user's email address, and password
    static func signIn(email: String, password: String, onSuccess: @escaping () -> Void, onError: @escaping (_ errorMessage: String?) -> Void)
    {
        print("signin")
        Auth.auth().signIn(withEmail: email, password: password) { (user: AuthDataResult?, error: Error?) in
            if error != nil
            {
                onError(error!.localizedDescription)
                return
            }
            onSuccess()
            print("login button tapped!")
            let uid :String = (Auth.auth().currentUser?.uid)!
            print("Current user ID is: " + uid)
            print("current User Email is: ", user?.user.email! as Any)            // print console user's email
        }
    }
    // Internal method that resets a user's password, new password provided by user through webportal found in their email inbox
    static func resetPassword(email: String, onSuccess: @escaping () -> Void, onError: @escaping (_ errorMessage: String?) -> Void) {
        // Attempt to send a password reset to user's email through firebase
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if error == nil {
                // Success, onSuccess function handles password change.
                onSuccess()
            }
            else{
                onError(error!.localizedDescription)
            }
        }
    }
    
}
