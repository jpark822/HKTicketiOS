//
//  CustomerSearchResultTableViewCell.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 6/30/15.
//  Copyright © 2015 JPApps. All rights reserved.
//

import UIKit

class CustomerSearchResultTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureWithCustomer(_customer:Customer) {
        self.nameLabel.text = "\(_customer.firstName) \(_customer.lastName)";
        self.emailLabel.text = "\(_customer.email)";
    }

}
