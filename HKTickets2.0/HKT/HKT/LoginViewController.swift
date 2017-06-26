//
//  LoginViewController.swift
//  HKT
//
//  Created by Jay Park on 5/21/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        let homeVC = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(withIdentifier: "homeViewControllerId")
        
        _ = ServiceManager.sharedInstance.login(username: usernameTextField.text!, password: passwordTextField.text!, success: { (task, response) in
            DispatchQueue.main.async(execute: { 
                self.present(homeVC, animated: true, completion: {
                })
            })
        }){ (task, error) in
            NSLog("Auth failed")
        }
        
//        self.present(ticketSearchVC, animated: true) {
//            
//        }
    }
    

}
