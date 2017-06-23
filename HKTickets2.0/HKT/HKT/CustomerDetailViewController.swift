//
//  CustomerDetailViewController.swift
//  HKT
//
//  Created by Jay Park on 6/18/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import UIKit

protocol CustomerDetailViewControllerDelegate:class {
    func CustomerDetailViewControllerDidPressCancel() -> Void
    func CustomerDetailViewControllerDidSave() -> Void
}

class CustomerDetailViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var middleNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var address2TextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipTextField: UITextField!
    
    var customer:CustomerModel?
    weak var delegate:CustomerDetailViewControllerDelegate?
    
    var isNewCustomer:Bool {
        get {
            if self.customer == nil {
                return true
            }
            return false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let customer = self.customer {
            self.populateViewWithCustomer(customer)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (self.isNewCustomer) {
            self.title = "New Customer"
        }
        else {
            self.title = "Customer Info"
        }
    }
    
    func populateViewWithCustomer(_ customer:CustomerModel) {
        self.firstNameTextField.text = customer.firstName
        self.lastNameTextField.text = customer.lastName
        self.middleNameTextField.text = customer.middleName
        self.phoneTextField.text = customer.phone
        self.emailTextField.text = customer.email
        self.addressTextField.text = customer.address
        self.address2TextField.text = customer.address2
        self.cityTextField.text = customer.city
        self.stateTextField.text = customer.state
        self.zipTextField.text = String(customer.zip)
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        if let delegate = self.delegate {
            delegate.CustomerDetailViewControllerDidPressCancel()
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        if let delegate = self.delegate {
            delegate.CustomerDetailViewControllerDidSave()
        }
    }
    
}
