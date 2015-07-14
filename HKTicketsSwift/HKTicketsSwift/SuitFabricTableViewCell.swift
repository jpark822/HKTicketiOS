//
//  SuitFabricTableViewCell.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 6/10/15.
//  Copyright © 2015 JPApps. All rights reserved.
//

import UIKit

class SuitFabricTableViewCell: UITableViewCell {

    @IBOutlet weak var jacketFabricLabel: UILabel!
    @IBOutlet weak var pantsFabricLabel: UILabel!
    @IBOutlet weak var vestFabricLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureWithSuitFabricUnit(_fabrics: SuitFabricUnit) {
        self.jacketFabricLabel.text = "Jacket Fabric: \(_fabrics.suitFabric)"
        self.pantsFabricLabel.text = "Pants Fabric: \(_fabrics.suitFabric)"
        self.vestFabricLabel.text = _fabrics.vestFabric ?? "No Vest";
    }
}
