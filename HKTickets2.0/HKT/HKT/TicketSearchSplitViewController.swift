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
    
    var searchDetailVC:TicketListTableViewController? {
        get {
            if let detailNavVC = self.detailViewController as? TicketListTableViewController {
                return detailNavVC
            }
            return nil
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let searchMasterVC = self.searchMasterVC {
            searchMasterVC.delegate = self
        }
    }
    
    //MARK: TicketSearchCriteriaViewControllerDelegate
    func ticketSearchCriteriaViewControllerDidPressDone() {
        self.dismiss(animated: true)
    }
    
    func ticketSearchCriteriaViewControllerDidFinishSearching(ticketResults: [TicketModel]) {
        self.searchDetailVC?.ticketModels = ticketResults
    }

}
