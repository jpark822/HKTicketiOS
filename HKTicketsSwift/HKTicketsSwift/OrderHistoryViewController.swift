//
//  OrderHistoryViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 7/28/15.
//  Copyright © 2015 JPApps. All rights reserved.
//

import UIKit

class OrderHistoryViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func backButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        };
    }
    
    //MARK: tableview
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("orderHistoryCellId") as! OrderHistoryTableCell;
        cell.orderNumberLabel.text = "Order #: change to order number";
        cell.dateLabel.text = "Date: change to date";
        
        return cell;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 77;
    }
}
