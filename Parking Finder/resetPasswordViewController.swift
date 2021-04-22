//
//  File.swift
//  Parking Finder
//
//  Created by Trevor Trusty on 4/20/21.
//
import UIKit
import FirebaseDatabase
import FirebaseAuth

class resetPasswordViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate
{
    private let database = Database.database().reference()

    @IBOutlet weak var userEmailForResetField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        userEmailForResetField.delegate = self
        // shadow for login button
        handleTextField()
    }
    
    func handleTextField()
    {
        userEmailForResetField.addTarget(self, action: #selector(loginViewController.textFieldDidChange), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange()
    {
        guard let emailForReset = userEmailForResetField.text, !emailForReset.isEmpty
        else
        {
            return
        }
    }
    
    @IBAction func resetPasswordDidTapped(_ sender: Any)
    {
        guard let emailAddr = userEmailForResetField.text, emailAddr != ""
        else
        {
            let alert = UIAlertController(title: "Error", message: "Please provide email associated with your account.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
            return
        }
        AuthService.resetPassword(email: emailAddr, onSuccess:
        {
            self.view.endEditing(true)
                    
            //Alert user to check email inbox for password reset confirmation
            let alert = UIAlertController(title: "Success", message: "Thank you, please check your email inbox for the next step!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        
            // Navigate back to login
            self.navigationController?.popViewController(animated: true)
        })
        { (errorMessage) in
            // Show error message
            let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")}))
            self.present(alert, animated: true, completion: nil)
        }
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
        userEmailForResetField.resignFirstResponder()
    }
}
