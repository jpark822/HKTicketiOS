//
//  CustomerSplitViewController.swift
//  HKT
//
//  Created by Jay Park on 5/22/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import UIKit

class CustomerSplitViewController: UISplitViewController, CustomerSearchCriteriaViewControllerDelegate {
    
    var customerSearchMasterVC:CustomerSearchCriteriaViewController? {
        get {
            if let masterNavVC = self.masterViewController as? UINavigationController,
                let customerCriteriaVC = masterNavVC.viewControllers[0] as? CustomerSearchCriteriaViewController {
                return customerCriteriaVC
            }
            else {
                return nil
            }
        }
    }
    
    var customerSearchDetailVC:CustomerSearchResultTableViewController? {
        get {
            guard let detailNavVC = self.detailViewController as? UINavigationController else {
                return nil
            }
            guard detailNavVC.viewControllers.count > 0 else {
                return nil
            }
            if let customerResultsVC = detailNavVC.viewControllers[0] as? CustomerSearchResultTableViewController {
                return customerResultsVC
            }
            else {
                return nil
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let searchCriteriaVC = self.customerSearchMasterVC {
            searchCriteriaVC.delegate = self
        }
    }
    
    //MARK: - CustomerSearchCriteriaViewControllerDelegate
    func CustomerSearchCriteriaViewControllerDidFinishSearching(customerResults: [CustomerModel]) {
        self.customerSearchDetailVC?.customers = customerResults
    } 
    
    func CustomerSearchCriteriaViewControllerDidPressBack() {
        self.dismiss(animated: true) { 
        }
    }


}
