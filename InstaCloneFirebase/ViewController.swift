//
//  ViewController.swift
//  InstaCloneFirebase
//
//  Created by Abdulkadir Cevik on 17.10.2022.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentUser = Auth.auth().currentUser
        
        if currentUser != nil {
            performSegue(withIdentifier: "toFeedVC", sender: nil)
            
        }
    }

    @IBAction func signInButton(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { authData, error in
                if error != nil {
                    self.makeAlert(AlertTitle: "Error!", AlertMessage: error?.localizedDescription ?? "Error")
                }else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
            
        }else {
            makeAlert(AlertTitle: "Error!", AlertMessage: "Email/Password not found.")
        }
        
        
        
        
        
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        
        
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { authData, error in
                
                if error != nil {
                    self.makeAlert(AlertTitle: "Error!", AlertMessage: error?.localizedDescription ?? "Error")
                    
                    
                }else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
            
        }else {
            makeAlert(AlertTitle: "Error!", AlertMessage: "Email/Password not found.")
            
            
        }
        
    }
    
    func makeAlert(AlertTitle: String, AlertMessage: String) {
        let alert = UIAlertController(title: AlertTitle, message: AlertMessage, preferredStyle: UIAlertController.Style.alert)
        let button = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(button)
        self.present(alert, animated: true)
        
    }
}

