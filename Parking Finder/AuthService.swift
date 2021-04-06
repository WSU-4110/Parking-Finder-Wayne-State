//
//  AuthService.swift
//  Parking Finder
//
//  Created by Server on 3/11/21.
//

import Foundation
import FirebaseAuth

class AuthService
{
    static func signIn(email: String, password: String, onSuccess: @escaping () -> Void, onError: @escaping (_ errorMessage: String?) -> Void)          // method
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

}
