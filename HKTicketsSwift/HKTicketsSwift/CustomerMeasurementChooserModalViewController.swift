//
//  CustomerMeasurementChooserModalViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 6/30/15.
//  Copyright © 2015 JPApps. All rights reserved.
//

import UIKit

protocol CustomerMeasurementChooserDelegate {
    func CustomerMeasurementChooserDidSelectIndex(index:NSInteger);
}

class CustomerMeasurementChooserModalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var delegate : CustomerMeasurementChooserDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : CustomerMeasurementModalTableViewCell = tableView.dequeueReusableCellWithIdentifier("customerMeasurementModalCellId") as! CustomerMeasurementModalTableViewCell;
        
        return cell;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.dismissViewControllerAnimated(true, completion: nil);
        self.delegate?.CustomerMeasurementChooserDidSelectIndex(indexPath.row);
    }

}
