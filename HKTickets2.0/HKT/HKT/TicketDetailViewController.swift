//
//  TicketDetailViewController.swift
//  HKT
//
//  Created by Jay Park on 5/22/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import UIKit

class TicketDetailViewController: UIViewController {
    
    @IBOutlet weak var firstNameLabel: UILabel!
    
    var ticket:TicketModel! {
        didSet {
            guard self.isViewLoaded else {
                return
            }
            self.configureViewWithTicket(ticket)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func configureViewWithTicket(_ ticket:TicketModel) {
        self.firstNameLabel.text = ticket.fname
    }
}
