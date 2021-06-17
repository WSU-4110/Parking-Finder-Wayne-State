//
//  File.swift
//  Parking Finder
//
//  Class to handle user actions related to resetting a forgotten password in the app.
//  See: AuthService.swift for resetPassword singleton method
//
//  Created by Trevor on 4/20/21.
//
import UIKit
import FirebaseDatabase
import FirebaseAuth

class resetPasswordViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate
{
    // Connection to firebase database established
    private let database = Database.database().reference()

    // Initialize text field for user's email address
    @IBOutlet weak var userEmailForResetField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        userEmailForResetField.delegate = self
        // shadow for login button
        handleTextField()
    }
    
    // Method keeps track of changes made by user in the email address text field
    func handleTextField()
    {
        userEmailForResetField.addTarget(self, action: #selector(loginViewController.textFieldDidChange), for: UIControl.Event.editingChanged)
    }
    
    // See: handleTextField
    @objc func textFieldDidChange()
    {
        guard let emailForReset = userEmailForResetField.text, !emailForReset.isEmpty
        else
        {
            return
        }
    }
    
    // Action called when user taps reset button.
    // Calls resetPassword method to verify user's email and allow user to change their password online
    @IBAction func resetPasswordDidTapped(_ sender: Any)
    {
        // If email text field left blank, display an error dialog
        guard let emailAddr = userEmailForResetField.text, emailAddr != ""
        else
        {
            // Setup the error alert dialog
            let alert = UIAlertController(title: "Error", message: "Please provide email associated with your account.", preferredStyle: .alert)
            
            // OK button allow user to close error dialog and try again 
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.") 
            }))

            // Display error dialog
            self.present(alert, animated: true, completion: nil)
            return
        }

        // Input recieved, reset user's password through firebase
        AuthService.resetPassword(email: emailAddr, onSuccess:
        {
            self.view.endEditing(true)
                    
            // Setup alert informing user to check email inbox for password reset confirmation
            let alert = UIAlertController(title: "Success", message: "Thank you, please check your email inbox for the next step!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))

            // Display alert
            self.present(alert, animated: true, completion: nil)
        
            // Navigate back to login
            self.navigationController?.popViewController(animated: true)
        })
        { (errorMessage) in
            // In case of error, display error message
            let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")}))
            self.present(alert, animated: true, completion: nil)
        }
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
        userEmailForResetField.resignFirstResponder()
    }
}
