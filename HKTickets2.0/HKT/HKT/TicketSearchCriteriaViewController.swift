//
//  TicketSearchCriteriaViewController.swift
//  HKT
//
//  Created by Jay Park on 5/22/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import UIKit

protocol TicketSearchCriteriaViewControllerDelegate:class {
    func ticketSearchCriteriaViewControllerDidPressDone() -> Void
    func ticketSearchCriteriaViewControllerDidFinishSearching(ticketResults:[TicketModel]) -> Void
}

class TicketSearchCriteriaViewController: UIViewController {
    
    @IBOutlet weak var ticketIdTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var statusTextField: UITextField!
    @IBOutlet weak var orderIdTextField: UITextField!
    
    @IBOutlet weak var searchButton: UIButton!
    
    weak var delegate:TicketSearchCriteriaViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        if let delegate = self.delegate {
            delegate.ticketSearchCriteriaViewControllerDidPressDone()
        }
    }

    @IBAction func searchButtonPressed(_ sender: Any) {
        ServiceManager.sharedInstance.searchForTickets(ticketId: self.ticketIdTextField.text, firstName: self.firstNameTextField.text, lastName: self.lastNameTextField.text, phone: self.phoneTextField.text, email: self.emailTextField.text, status: self.statusTextField.text, orderId: self.orderIdTextField.text, success: { (ticketModels) in
            if let delegate = self.delegate {
                delegate.ticketSearchCriteriaViewControllerDidFinishSearching(ticketResults: ticketModels)
            }
        }) { (task, error) in
            NSLog("ticket search failed")
        }
    }
    
    
}
