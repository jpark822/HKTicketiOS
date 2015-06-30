//
//  CustomerSearchViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 6/30/15.
//  Copyright © 2015 JPApps. All rights reserved.
//

import UIKit

class CustomerSearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomerMeasurementChooserDelegate {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var middleNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipTextField: UITextField!
    @IBOutlet weak var telephoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchButton: UIButton!
    
    var customerResults : [NSObject] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.searchButton.layer.cornerRadius = HKTStyling.cornerRadiusMedium;
    }
    
    //MARK: table view delegate and data source
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : CustomerSearchResultTableViewCell = tableView.dequeueReusableCellWithIdentifier("customerSearchCellId") as! CustomerSearchResultTableViewCell;
        
        return cell;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let measurementChooserVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("customerMeasurementChooserModalId") as! CustomerMeasurementChooserModalViewController;
        measurementChooserVC.modalPresentationStyle = UIModalPresentationStyle.FormSheet;
        measurementChooserVC.preferredContentSize = CGSizeMake(450, 300);
        self.presentViewController(measurementChooserVC, animated: true, completion: nil);
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    //MARK: customer measurement chooser delegate
    func CustomerMeasurementChooserDidSelectIndex(index: NSInteger) {
        
    }
}
