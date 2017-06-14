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
    var ticketModels:[TicketModel] = [TicketModel]()
    
    let ticketCellReuseId = "ticketSearchCellReuseID"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //fake data
        for index in 1...5 {
            let mode = TicketModel(fname: "neil\(index)", lname: "balani")
            self.ticketModels.append(mode)
        }
        
        self.tableView.register(UINib(nibName: "TitleDetailTableViewCell", bundle: nil), forCellReuseIdentifier: self.ticketCellReuseId)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: self.ticketCellReuseId, for: indexPath) as! TitleDetailTableViewCell
        cell.setLabels(title: "what", detail: "it do")

        return cell
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    //MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = self.delegate {
            delegate.TicketListTableViewControllerDidSelectTicket(ticket:self.ticketModels[indexPath.row])
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    

}
