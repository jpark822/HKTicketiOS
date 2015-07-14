//
//  HomeViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 5/6/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController!.setNavigationBarHidden(true, animated: false);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func customOrderPressed(sender: AnyObject) {
        let orderFormNav : UINavigationController = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("OrderFormRootNavigationID") as! UINavigationController;
        self.presentViewController(orderFormNav, animated: true, completion: nil);
    }
    
    @IBAction func customersButtonPressed(sender: AnyObject) {
        let customerNav : UINavigationController = UIStoryboard(name: "Customer", bundle: nil).instantiateViewControllerWithIdentifier("customerRootNavigationId") as! OrderFormNavigationController;
        self.presentViewController(customerNav, animated: true, completion: nil);
    }
}
