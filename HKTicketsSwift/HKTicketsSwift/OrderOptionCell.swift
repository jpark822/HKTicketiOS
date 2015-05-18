//
//  OrderOptionCell.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 5/17/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit

class OrderOptionCell: UICollectionViewCell {

    @IBOutlet weak var optionImage: UIImageView!
    @IBOutlet weak var optionLabel: UILabel!
    
    override var selected: Bool {
        didSet {
            if self.selected {
                self.layer.borderColor = UIColor.blackColor().CGColor;
                self.layer.borderWidth = 1;
            } else {
                self.layer.borderWidth = 0;
            }
        }
    }
}

