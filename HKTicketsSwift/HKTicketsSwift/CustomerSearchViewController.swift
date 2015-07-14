//
//  CustomerSearchViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 6/30/15.
//  Copyright © 2015 JPApps. All rights reserved.
//

import UIKit

class CustomerSearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, OrderFormViewControllerDelegate {

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
        let orderFormNav : UINavigationController = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("OrderFormRootNavigationID") as! UINavigationController;
        (orderFormNav.viewControllers[0] as! HKTOrderFormViewController).delegate = self;
        self.presentViewController(orderFormNav, animated: true, completion: nil);
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func OrderFormViewControllerDidFinishOrder() {
        self.dismissViewControllerAnimated(true, completion: nil);
    }
}
