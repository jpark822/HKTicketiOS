//
//  TicketListTableViewController.swift
//  HKT
//
//  Created by Jay Park on 5/21/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import UIKit

protocol TicketListTableViewControllerDelegate:class {
    func TicketListTableViewControllerDidSelectTicket(ticket:TicketModel) -> Void
    func TicketListTableViewControllerBackButtonPressed() -> Void
}

class TicketListTableViewController: UITableViewController {
    
    weak var delegate:TicketListTableViewControllerDelegate?
    var ticketModels:[TicketModel] = [TicketModel]() {
        didSet {
            guard self.isViewLoaded else {
                return
            }
            self.tableView.reloadData()
        }
    }
    
    let ticketCellReuseId = "ticketSearchCellReuseID"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "TicketOverviewTableViewCell", bundle: nil), forCellReuseIdentifier: self.ticketCellReuseId)
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        self.delegate?.TicketListTableViewControllerBackButtonPressed()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ticketModels.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.ticketCellReuseId, for: indexPath) as! TicketOverviewTableViewCell
        let ticket = ticketModels[indexPath.row]
        cell.configureWithTicket(ticket)

        return cell
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144
    }
    
    //MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let delegate = self.delegate {
            delegate.TicketListTableViewControllerDidSelectTicket(ticket:self.ticketModels[indexPath.row])
        }
    }

}
