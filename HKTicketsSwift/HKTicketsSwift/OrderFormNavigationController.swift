//
//  OrderFormNavigationController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 7/7/15.
//  Copyright © 2015 JPApps. All rights reserved.
//

import UIKit

class OrderFormNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UINavigationBar.appearance().barTintColor = HKTStyling.darkRed;
        UINavigationBar.appearance().tintColor = UIColor.whiteColor();
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()];
        
        self.setNeedsStatusBarAppearanceUpdate();
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent;
    }

}
