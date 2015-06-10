//
//  SuitFabricChooserViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 6/9/15.
//  Copyright © 2015 JPApps. All rights reserved.
//

import UIKit

class SuitFabricChooserViewController: UIViewController, SuitFabricModalDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addFabricPressed(sender: AnyObject) {
        let modal = UIStoryboard(name: "SuitOrder", bundle: nil).instantiateViewControllerWithIdentifier("suitFabricModalId") as! SuitFabricModalViewController;
        modal.delegate = self;
        self.presentViewController(modal, animated: true, completion: nil);
    }
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
    }
    
    func suitFabricModalFinishedAddingFabrics(jacket: String, pants: String, vest: String) {
        NSLog("\(jacket), \(pants), \(vest)");
        
    }
    
}
