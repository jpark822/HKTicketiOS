//
//  TicketOverviewTableViewCell.swift
//  HKT
//
//  Created by Jay Park on 6/29/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import UIKit

class TicketOverviewTableViewCell: UITableViewCell {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var dateInLabel: UILabel!
    @IBOutlet weak var dateReadyLabel: UILabel!
    @IBOutlet weak var tailorLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var ticketIdLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var depositLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureWithTicket(_ ticket:TicketModel) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        self.firstNameLabel.text = "\(ticket.customer.firstName)"
        self.lastNameLabel.text = "\(ticket.customer.lastName)"
        if let dateIn = ticket.dateIn {
            self.dateInLabel.text = "Date In: \(dateFormatter.string(from: dateIn))"
        }
        if let dateReady = ticket.dateReady {
            self.dateReadyLabel.text = "Date Ready: \(dateFormatter.string(from: dateReady))"
        }
        self.tailorLabel.text = ticket.tailorName
        self.statusLabel.text = ticket.status.rawValue
        self.ticketIdLabel.text = String(ticket.id)
        self.totalLabel.text = String(format: "Total: $%.02f", locale: Locale.current, arguments: [ticket.totalPrice])
        self.depositLabel.text = String(format: "Deposit: $%.02f", locale: Locale.current, arguments: [ticket.deposit])
        
        let balance = ticket.totalPrice - ticket.deposit
        self.balanceLabel.text = String(format: "Balance: $%.02f", locale: Locale.current, arguments: [balance])
    }

}
