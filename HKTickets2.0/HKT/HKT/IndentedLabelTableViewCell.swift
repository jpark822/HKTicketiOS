//
//  IndentedLabelTableViewCell.swift
//  HKT
//
//  Created by Jay Park on 6/26/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import UIKit

class IndentedLabelTableViewCell: UITableViewCell {

    @IBOutlet weak var indentationConstraint: NSLayoutConstraint!
    @IBOutlet weak var mainTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
