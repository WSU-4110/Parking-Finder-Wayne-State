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
    @IBOutlet weak var createUserButton: UIButton!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        userEmailField.delegate = self
        userNameField.delegate = self
        userPasswordField.delegate = self
        
        // shadow for create account button
        createUserButton.layer.shadowColor = UIColor.black.cgColor
        createUserButton.layer.shadowOffset = CGSize(width: 2, height: 3)
        createUserButton.layer.shadowRadius = 1.0
        createUserButton.layer.shadowOpacity = 1.5
    }

    @IBAction func createUserButton(_ sender: Any)
    {
        // singleton design pattern
        signUpUsers.sharedInstance.fetchNewUser(username: userNameField.text!, email: userEmailField.text!, password: userPasswordField.text!, completion: {
            self.performSegue(withIdentifier: "createToTabBarVC", sender: nil)      // go to home VC if user successfully created an account
        }, onError: { (error) in
            print(error!)
        })
    }

    // Keyboard methods for fields
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
