//
//  TitleDetailSectionView.swift
//  HKT
//
//  Created by Jay Park on 6/25/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import UIKit

class TitleDetailSectionView: UIView {

    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var mainDetailLabel: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }
    
    func setLabels(title:String, detail:String) {
        self.mainTitleLabel.text = title
        self.mainDetailLabel.text = detail
    }

}
