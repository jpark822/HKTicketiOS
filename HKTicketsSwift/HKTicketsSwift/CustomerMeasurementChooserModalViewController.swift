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
    
    var finishMeasurements : [FinishMeasurements] = [];

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cancelButton: UIButton!
    
    var delegate : CustomerMeasurementChooserDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        self.cancelButton.layer.cornerRadius = HKTStyling.cornerRadiusMedium;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : CustomerMeasurementModalTableViewCell = tableView.dequeueReusableCellWithIdentifier("customerMeasurementModalCellId") as! CustomerMeasurementModalTableViewCell;
        cell.configureWithFinishMeasurement(self.finishMeasurements[indexPath.row]);
        
        return cell;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.finishMeasurements.count;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.dismissViewControllerAnimated(true, completion: nil);
        self.delegate?.CustomerMeasurementChooserDidSelectIndex(indexPath.row);
    }

    @IBAction func canceButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }
}
