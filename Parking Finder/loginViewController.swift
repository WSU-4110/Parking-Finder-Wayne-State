//
//  loginViewController.swift
//  Parking Finder
//
//  Created by Server on 2/15/21.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class loginViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate
{

    private let database = Database.database().reference()
    
    @IBOutlet weak var userNameLoginField: UITextField!
    @IBOutlet weak var userPasswordLoginField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        userNameLoginField.delegate = self
        userPasswordLoginField.delegate = self
        
        // shadow for login button
        loginButton.layer.shadowColor = UIColor.black.cgColor
        loginButton.layer.shadowOffset = CGSize(width: 2, height: 3)
        loginButton.layer.shadowRadius = 1.0
        loginButton.layer.shadowOpacity = 1.5
    }

    @IBAction func loginButton(_ sender: Any)
    {
        
        Auth.auth().signIn(withEmail: userNameLoginField.text!, password: userPasswordLoginField.text!) { (user: AuthDataResult?, error: Error?) in
            if error != nil
            {
                print(error!.localizedDescription)
                return
            }
            print(user?.user.email! as Any)                                                  // print console user's email
            self.performSegue(withIdentifier: "loginToTabBarVC", sender: nil)       // user successfully login in with email and password go to home VC
        }
        
        
        
        
        /* once tapped naviagate to home page-----------------------------------------------------
        guard let vc = storyboard?.instantiateViewController(identifier: "home_vc") as? homeViewController
        else
        {
            return
        }
        present(vc, animated: true)
        //-----------------------------------------------------------------------------------------
        
        
        // Login Profile Button is hidden when tapped--------------------------------------------
        let tapButton : UIButton = sender as! UIButton
            tapButton.isHidden = true;
        */
    }
    
    
    
    
    @IBAction func noAccountButton(_ sender: Any)
    {
        
        
    }
    
    
    
    
    
    
    //keyboard methods for fields
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        hidekeyboardProfile()
        return true
    }
    func hidekeyboardProfile()
    {
        print("Hide Keyboard")
        userNameLoginField.resignFirstResponder()
        userPasswordLoginField.resignFirstResponder()
    }
}
