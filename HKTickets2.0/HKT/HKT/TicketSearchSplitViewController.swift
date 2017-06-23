//
//  TicketSearchSplitViewController.swift
//  HKT
//
//  Created by Jay Park on 6/18/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import UIKit

class TicketSearchSplitViewController: UISplitViewController, TicketSearchCriteriaViewControllerDelegate {
    
    var searchMasterVC:TicketSearchCriteriaViewController? {
        get {
            if let masterNavVC = self.masterViewController as? UINavigationController,
                let searchVC = masterNavVC.viewControllers[0] as? TicketSearchCriteriaViewController {
                return searchVC
            }
            else {
                return nil
            }
        }
    }
    
    var searchDetailVC:TicketDetailViewController? {
        get {
            guard let detailNavVC = self.detailViewController as? UINavigationController else {
                return nil
            }
            guard detailNavVC.viewControllers.count > 0 else {
                return nil
            }
            if let ticketDetailVC = detailNavVC.viewControllers[0] as? TicketDetailViewController {
                return ticketDetailVC
            }
            else {
                return nil
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let searchMasterVC = self.searchMasterVC {
            searchMasterVC.delegate = self
        }
    }
    
    //MARK: TicketSearchCriteriaViewControllerDelegate
    func TicketSearchCriteriaViewControllerDidPressDone() {
        self.dismiss(animated: true)
    }
    
    func TicketSearchCriteriaViewControllerDidPressSearch(request: URLSessionDataTask) {
        NSLog("Search")
    }

}
