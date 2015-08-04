//
//  CustomerSearchViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 6/30/15.
//  Copyright © 2015 JPApps. All rights reserved.
//

import UIKit
import MBProgressHUD

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
    
    @IBOutlet weak var viewMeasurementsButton: UIButton!
    @IBOutlet weak var newOrderButton: UIButton!
    
    var searchResults : [Customer] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        self.searchButton.layer.cornerRadius = HKTStyling.cornerRadiusMedium;
        self.viewMeasurementsButton.layer.cornerRadius = HKTStyling.cornerRadiusMedium;
        self.newOrderButton.layer.cornerRadius = HKTStyling.cornerRadiusMedium;
        
    }
    
    @IBAction func openMeasurementsPressed(sender: AnyObject) {
        
        let selectedRow = self.tableView.indexPathForSelectedRow?.row;
        if (selectedRow != nil) {
            let orderFormNav : UINavigationController = UIStoryboard(name: "Measurements", bundle: nil).instantiateViewControllerWithIdentifier("measurementsRootNavId") as! BaseNavigationController;
            (orderFormNav.viewControllers[0] as! CustomerMeasurementsViewController).customer = self.searchResults[selectedRow!];
            self.presentViewController(orderFormNav, animated: true, completion: nil);
        }

    }
    
    @IBAction func newOrderPressed(sender: AnyObject) {
        let selectedRow = self.tableView.indexPathForSelectedRow?.row;
        if (selectedRow != nil) {
            let orderFormNav : UINavigationController = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("OrderFormRootNavigationID") as! BaseNavigationController;
            (orderFormNav.viewControllers[0] as! HKTOrderFormViewController).delegate = self;
            (orderFormNav.viewControllers[0] as! HKTOrderFormViewController).customer = self.searchResults[selectedRow!];
            self.presentViewController(orderFormNav, animated: true, completion: nil);
        }
    }
    
    //MARK: table view delegate and data source
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : CustomerSearchResultTableViewCell = tableView.dequeueReusableCellWithIdentifier("customerSearchCellId") as! CustomerSearchResultTableViewCell;
        cell.configureWithCustomer(self.searchResults[indexPath.row]);
        return cell;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchResults.count;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.viewMeasurementsButton.enabled = true;
        self.newOrderButton.enabled = true;
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    func OrderFormViewControllerDidFinishOrder() {
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    @IBAction func searchButtonPressed(sender: AnyObject) {
        let loadingHUD = MBProgressHUD.showHUDAddedTo(self.tableView, animated: true);
        loadingHUD.labelText = "searching...";
        self.viewMeasurementsButton.enabled = false;
        self.newOrderButton.enabled = false;
        
        var queryParams = Dictionary<CustomerQueryParam, String>()
        if (firstNameTextField.text != "") {
            queryParams[CustomerQueryParam.FirstName] = firstNameTextField.text;
        }
        if (middleNameTextField.text != "") {
            queryParams[CustomerQueryParam.MiddleName] = middleNameTextField.text;
        }
        if (lastNameTextField.text != "") {
            queryParams[CustomerQueryParam.LastName] = lastNameTextField.text;
        }
        if (addressTextField.text != "") {
            queryParams[CustomerQueryParam.Address] = addressTextField.text;
        }
        if (cityTextField.text != "") {
            queryParams[CustomerQueryParam.City] = cityTextField.text;
        }
        if (stateTextField.text != "") {
            queryParams[CustomerQueryParam.State] = stateTextField.text;
        }
        if (zipTextField.text != "") {
            queryParams[CustomerQueryParam.Zip] = zipTextField.text;
        }
        if (telephoneTextField.text != "") {
            queryParams[CustomerQueryParam.Phone] = telephoneTextField.text;
        }
        if (emailTextField.text != "") {
            queryParams[CustomerQueryParam.Email] = emailTextField.text;
        }
        
        ServiceManager.sharedManager.getCustomersBySearchParameters(queryParams, success: { (searchResults) -> () in
            self.searchResults = searchResults;
            self.tableView .reloadData();
            loadingHUD.hide(true);
            NSLog("%i customer search results", self.searchResults.count);
            }) { (error) -> () in
                loadingHUD.hide(true);
                NSLog("search failed");
        }
    }
}
