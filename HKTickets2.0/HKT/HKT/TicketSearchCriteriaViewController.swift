//
//  TicketSearchCriteriaViewController.swift
//  HKT
//
//  Created by Jay Park on 5/22/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import UIKit

protocol TicketSearchCriteriaViewControllerDelegate:class {
    func TicketSearchCriteriaViewControllerDidPressDone() -> Void
    func TicketSearchCriteriaViewControllerDidPressSearch(request: URLSessionDataTask) -> Void
}

class TicketSearchCriteriaViewController: UIViewController {
    
    @IBOutlet weak var searchButton: UIButton!
    
    weak var delegate:TicketSearchCriteriaViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        if let delegate = self.delegate {
            delegate.TicketSearchCriteriaViewControllerDidPressDone()
        }
    }

    @IBAction func searchButtonPressed(_ sender: Any) {
        if let delegate = self.delegate {
            delegate.TicketSearchCriteriaViewControllerDidPressSearch(request: URLSessionDataTask())
        }
    }
    
    
}
