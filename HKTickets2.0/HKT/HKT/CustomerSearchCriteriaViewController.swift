//
//  CustomerSearchCriteriaViewController.swift
//  HKT
//
//  Created by Jay Park on 5/22/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import UIKit

protocol CustomerSearchCriteriaViewControllerDelegate:class {
    func CustomerSearchCriteriaViewControllerDidFinishSearching(customerResults:[CustomerModel]) -> Void
    func CustomerSearchCriteriaViewControllerDidPressBack() -> Void
}

class CustomerSearchCriteriaViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var middleNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    weak var delegate:CustomerSearchCriteriaViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func searchButtonPressed(_ sender: Any) {
        ServiceManager.sharedInstance.searchForCustomers(firstName: self.firstNameTextField.text, middleName: self.middleNameTextField.text, lastName: self.lastNameTextField.text, address: self.addressTextField.text, city: self.cityTextField.text, state: self.stateTextField.text, zip: self.zipTextField.text, phone: self.phoneTextField.text, email: self.emailTextField.text, success: { (customers) in
            DispatchQueue.main.async {
                if let delegate = self.delegate {
                    delegate.CustomerSearchCriteriaViewControllerDidFinishSearching(customerResults: customers)
                }
            }
        }) { (task, error) in
            NSLog("search failed")
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        if let delegate = self.delegate {
            delegate.CustomerSearchCriteriaViewControllerDidPressBack()
        }
        
    }

}
