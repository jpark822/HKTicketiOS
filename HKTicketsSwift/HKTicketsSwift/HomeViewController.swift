//
//  HomeViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 5/6/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var customersButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController!.setNavigationBarHidden(true, animated: false);
        self.customersButton.layer.cornerRadius = HKTStyling.cornerRadiusMedium;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func customersButtonPressed(sender: AnyObject) {
        let customerNav : UINavigationController = UIStoryboard(name: "Customer", bundle: nil).instantiateViewControllerWithIdentifier("customerRootNavigationId") as! BaseNavigationController;
        self.presentViewController(customerNav, animated: true, completion: nil);
    }
}
