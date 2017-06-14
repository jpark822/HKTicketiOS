//
//  UISplitViewController+MasterDetail.swift
//  HKT
//
//  Created by Jay Park on 5/21/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import Foundation
import UIKit

extension UISplitViewController {
    var masterViewController: UIViewController? {
        return self.viewControllers.first
    }
    
    var detailViewController: UIViewController? {
        return self.viewControllers.count > 1 ? self.viewControllers[1] : nil
    }
}
