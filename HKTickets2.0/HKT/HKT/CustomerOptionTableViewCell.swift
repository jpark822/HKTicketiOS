//
//  CustomerOptionTableViewCell.swift
//  HKT
//
//  Created by Jay Park on 6/27/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import UIKit

protocol CustomerOptionTableViewCellDelegate:class {
    func CustomerOptionTableViewCellDidPressEditCustomer(cell:CustomerOptionTableViewCell)
    func CustomerOptionTableViewCellDidPressMeasurements(cell:CustomerOptionTableViewCell)
}

class CustomerOptionTableViewCell: UITableViewCell {
    
    var customer = CustomerModel()
    weak var delegate:CustomerOptionTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    @IBAction func editCustomerPressed(_ sender: Any) {
        if let delegate = self.delegate {
            delegate.CustomerOptionTableViewCellDidPressEditCustomer(cell: self)
        }
    }
    
    @IBAction func measurementsPressed(_ sender: Any) {
        if let delegate = self.delegate {
            delegate.CustomerOptionTableViewCellDidPressMeasurements(cell: self)
        }
    }
    
}
