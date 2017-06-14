//
//  LoginViewController.swift
//  HKT
//
//  Created by Jay Park on 5/21/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        let ticketSearchVC = UIStoryboard(name: "HomeStoryboard", bundle: nil).instantiateViewController(withIdentifier: "homeViewControllerId")
        self.present(ticketSearchVC, animated: true) {
            
        }
    }
    

}
