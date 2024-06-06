//
//  SettingsViewController.swift
//  InstaCloneFirebase
//
//  Created by Abdulkadir Cevik on 19.10.2022.
//

import UIKit
import Firebase


class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logoutButton(_ sender: Any) {
        do {
           try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toViewController", sender: nil)
        }catch {
            print("error")
        }
        
        
    }
    
}
