//
//  CustomerSearchResultTableViewController.swift
//  HKT
//
//  Created by Jay Park on 5/22/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import UIKit

class CustomerSearchResultTableViewController: UITableViewController {
    
    private let customerCellReuseId = "customerSearchResultCellId"
    
    var customers = [CustomerModel]() {
        didSet {
            guard self.isViewLoaded else {
                return
            }
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "TitleDetailTableViewCell", bundle: nil), forCellReuseIdentifier: self.customerCellReuseId)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return customers.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader:TitleDetailSectionView = UIView.fromNib()
        let customer = self.customers[section]
        sectionHeader.setLabels(title: customer.firstName, detail: customer.lastName)
        return sectionHeader
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.customerCellReuseId, for: indexPath) as! TitleDetailTableViewCell

        let customer = self.customers[indexPath.row]
        cell.setLabels(title: customer.firstName, detail: customer.lastName)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 85
    }

}
