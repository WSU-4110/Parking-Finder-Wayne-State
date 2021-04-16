//
//  Parking_FinderTests.swift
//  Parking FinderTests
//
//  Created by Server on 2/7/21.
//

import CoreData
import UIKit
import MapKit
import XCTest
 
@testable import Parking_Finder

class Parking_finderTests: XCTestCase
{
       
          
        var userEmail: UITextField!
        var userPassword: UITextField!
        var loginButton: UIButton!
        var userEmailField: UITextField!
        var userNameField: UITextField!
        var userPasswordField: UITextField!
        var createUserButton: UIButton!
    
    
    func test_textField_Empty()
    
    createUserButton.layer.shadowColor = UIColor.black.cgColor
    createUserButton.layer.shadowOffset = CGSize(width: 2, height: 3)
    createUserButton.layer.shadowRadius = 1.0
    createUserButton.layer.shadowOpacity = 1.5
    
    XCTAssertFalse(login.loginButton.isEnabled == false)
}
 override func setup()
 {
print("Hide Keyboard")
userEmailField.resignFirstResponder()
userNameField.resignFirstResponder()
userPasswordField.resignFirstResponder()
}

    func test_textField_Used()
    XCTAssertNil(password, email, password)
    "email":userEmailField.text!,
    "username":userNameField.text!,
    "password":userPasswordField.text!
]
database.child("Users").childByAutoId().setValue(createProfileObject)

// Create Profile Button is hidden when tapped
let tapButton : UIButton = sender as! UIButton
    tapButton.isHidden = true;
               XCTAssertFalse(login.loginButton.isEnabled == false)
}
}

func test_textField_Used(email: String, password: String, onSuccess: @escaping () -> Void, onError:(String?)
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

    func test_textField_Used()
XCTAsserNil(UserPassword)
userEmailField.text!, password: userPasswordField.text!, completion: {
    self.performSegue(withIdentifier: "createToTabBarVC", sender: nil)
{
        XCTAssertFalse(login.loginButton.isEnabled == false)
}
}



func test_textField_Used()
XCTAsserNil(Logout)
func logOut_Button(_ sender: Any)
{
    do
    {
        try Auth.auth().signOut()
    }
    catch let LogoutError
    {
        print(LogoutError)
    }

    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    print("log out button tapped!")
    let signInVC = storyboard.instantiateViewController(withIdentifier: "loginViewController")
    self.present(signInVC, animated: true, completion: nil)
    print("No Current User Signed in")
}
        XCTAssertFalse(login.loginButton.isEnabled == false)
}
}

