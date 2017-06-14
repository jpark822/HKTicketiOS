//
//  CustomerSearchCriteriaViewController.swift
//  HKT
//
//  Created by Jay Park on 5/22/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import UIKit

protocol CustomerSearchCriteriaViewControllerDelegate:class {
    func CustomerSearchCriteriaViewControllerDidPressSearch() -> Void
    func CustomerSearchCriteriaViewControllerDidPressBack() -> Void
}

class CustomerSearchCriteriaViewController: UIViewController {

    weak var delegate:CustomerSearchCriteriaViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func searchButtonPressed(_ sender: Any) {
        if let delegate = self.delegate {
            delegate.CustomerSearchCriteriaViewControllerDidPressSearch()
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        if let delegate = self.delegate {
            delegate.CustomerSearchCriteriaViewControllerDidPressBack()
        }
        
    }

}
