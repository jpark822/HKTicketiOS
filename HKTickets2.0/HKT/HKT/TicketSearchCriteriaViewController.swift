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
    
    @IBOutlet weak var statusSegmentedControl: UISegmentedControl!
    @IBOutlet weak var orderIdTextField: UITextField!
    
    @IBOutlet weak var searchButton: UIButton!
    
    weak var delegate:TicketSearchCriteriaViewControllerDelegate?
    
    private enum StatusSegments:Int {
        case na = 0
        case active = 1
        case done = 2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.statusSegmentedControl.removeAllSegments()
        self.statusSegmentedControl.insertSegment(withTitle: "N/A", at: StatusSegments.na.rawValue, animated: false)
        self.statusSegmentedControl.insertSegment(withTitle: "Active", at: StatusSegments.active.rawValue, animated: false)
        self.statusSegmentedControl.insertSegment(withTitle: "Done", at: StatusSegments.done.rawValue, animated: false)
        self.statusSegmentedControl.selectedSegmentIndex = 0
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        if let delegate = self.delegate {
            delegate.ticketSearchCriteriaViewControllerDidPressDone()
        }
    }

    @IBAction func searchButtonPressed(_ sender: Any) {
        var statusString = ""
        switch self.statusSegmentedControl.selectedSegmentIndex {
        case StatusSegments.na.rawValue:
            break
        case StatusSegments.active.rawValue:
            statusString = "a"
        case StatusSegments.done.rawValue:
            statusString = "d"
        default:
            break
        }
        
        ServiceManager.sharedInstance.searchForTickets(ticketId: self.ticketIdTextField.text, firstName: self.firstNameTextField.text, lastName: self.lastNameTextField.text, phone: self.phoneTextField.text, email: self.emailTextField.text, status: statusString, orderId: self.orderIdTextField.text, success: { (ticketModels) in
            if let delegate = self.delegate {
                delegate.ticketSearchCriteriaViewControllerDidFinishSearching(ticketResults: ticketModels)
            }
        }) { (task, error) in
            NSLog("ticket search failed")
        }
    }
    
    
}
