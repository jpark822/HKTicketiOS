//
//  CustomerMeasurementModalTableViewCell.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 6/30/15.
//  Copyright © 2015 JPApps. All rights reserved.
//

import UIKit

class CustomerMeasurementModalTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureWithFinishMeasurement(finish : FinishMeasurements) {
        self.nameLabel.text = finish.name;
    }

}
