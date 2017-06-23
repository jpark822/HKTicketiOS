//
//  TicketListSplitViewController.swift
//  HKT
//
//  Created by Jay Park on 5/21/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import UIKit

class TicketListSplitViewController: UISplitViewController, TicketListTableViewControllerDelegate {
    
    var ticketMasterVC:TicketListTableViewController? {
        get {
            if let masterNavVC = self.masterViewController as? UINavigationController,
                let ticketVC = masterNavVC.viewControllers[0] as? TicketListTableViewController {
                return ticketVC
            }
            else {
                return nil
            }
        }
    }
    
    var ticketDetailVC:TicketDetailViewController? {
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
        
        if let ticketMasterVC = self.ticketMasterVC {
            ticketMasterVC.delegate = self
        }
    }
    
    //MARK: - TicketListTableViewControllerDelegate
    func TicketListTableViewControllerDidSelectTicket(ticket: TicketModel) {
        self.ticketDetailVC?.ticket = ticket
    }
    
    func TicketListTableViewControllerBackButtonPressed() {
        self.dismiss(animated: true) { 
        }
    }

}
