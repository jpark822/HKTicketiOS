//
//  CustomerMeasurementsViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 7/26/15.
//  Copyright © 2015 JPApps. All rights reserved.
//

import UIKit

class CustomerMeasurementsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var chestTextField: UITextField!
    @IBOutlet weak var waistTextField: UITextField!
    @IBOutlet weak var hipsTextField: UITextField!
    @IBOutlet weak var shouldersTextField: UITextField!
    @IBOutlet weak var jacketWidthTextField: UITextField!
    @IBOutlet weak var jacketLengthTextField: UITextField!
    @IBOutlet weak var jacketSleeveTextField: UITextField!
    @IBOutlet weak var bicepTextField: UITextField!
    @IBOutlet weak var armHoleTextField: UITextField!
    @IBOutlet weak var bellyTextField: UITextField!
    @IBOutlet weak var seatTextField: UITextField!
    @IBOutlet weak var crotchTextField: UITextField!
    @IBOutlet weak var actualThighTextField: UITextField!
    @IBOutlet weak var outseamTextField: UITextField!
    @IBOutlet weak var inseamTextField: UITextField!
    @IBOutlet weak var shirtLengthTextField: UITextField!
    @IBOutlet weak var wristTextField: UITextField!
    @IBOutlet weak var neckTextField: UITextField!
    @IBOutlet weak var shirtSleeveLengthTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    var customer : Customer = Customer();
    
    var finishMeasurements : [FinishMeasurements] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        ServiceManager.sharedManager.getBodyMeasurementsByCustomerId("12345", success: { (body : BodyMeasurements) -> () in
            self.chestTextField.text = body.chest;
            self.waistTextField.text = body.waist;
            self.hipsTextField.text = body.hips;
            self.shouldersTextField.text = body.shoulders;
            self.jacketWidthTextField.text = body.jacketWidth;
            self.jacketLengthTextField.text = body.jacketLength;
            self.bicepTextField.text = body.bicep;
            self.armHoleTextField.text = body.armHole;
            self.bellyTextField.text = body.belly;
            self.seatTextField.text = body.seat;
            self.crotchTextField.text = body.crotch;
            self.actualThighTextField.text = body.actualThigh;
            self.outseamTextField.text = body.outseam;
            self.inseamTextField.text = body.inseam;
            self.shirtLengthTextField.text = body.shirtLength;
            self.wristTextField.text = body.wrist;
            self.neckTextField.text = body.neckSize;
            self.shirtSleeveLengthTextField.text = body.shirtSleeveLength;
            self.jacketSleeveTextField.text = body.jacketSleeveLength;
            
            }) { (error : NSError!) -> () in
        };
        
        ServiceManager.sharedManager.getFinishMeasurementsByCustomerId("12345", success: { (finishMeasurements : [FinishMeasurements]) -> () in
            self.finishMeasurements = finishMeasurements;
            self.tableView.reloadData();
            
            }) { (error : NSError!) -> () in
                
        };
    }
    @IBAction func backButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        let body : BodyMeasurements = BodyMeasurements();
        body.chest = self.chestTextField.text!
        body.waist = self.waistTextField.text!
        body.hips = self.hipsTextField.text!
        body.shoulders = self.shouldersTextField.text!
        body.jacketWidth = self.jacketWidthTextField.text!
        body.jacketLength = self.jacketLengthTextField.text!
        body.bicep = self.bicepTextField.text!
        body.armHole = self.armHoleTextField.text!
        body.belly = self.bellyTextField.text!
        body.seat = self.seatTextField.text!
        body.crotch = self.crotchTextField.text!
        body.actualThigh = self.actualThighTextField.text!
        body.outseam = self.outseamTextField.text!
        body.inseam = self.inseamTextField.text!
        body.shirtLength = self.shirtLengthTextField.text!
        body.wrist = self.wristTextField.text!
        body.neckSize = self.neckTextField.text!
        body.shirtSleeveLength = self.shirtSleeveLengthTextField.text!
        body.jacketSleeveLength = self.jacketSleeveTextField.text!
        
        ServiceManager.sharedManager.postBodyMeasurementsForCustomer(self.customer.customerId, bodyMeasurements: body, success: { (responseDict : Dictionary<String, AnyObject>) -> () in
            
            }) { (error : NSError!) -> () in
                NSLog(error.description);
        }
    }
    
    @IBAction func addNewFinishMeasurementPressed(sender: AnyObject) {
        let finishMeasurementVC = UIStoryboard(name: "Measurements", bundle: nil).instantiateViewControllerWithIdentifier("finishMeasurementId") as! FinishMeasurementsViewController;
        self.navigationController?.pushViewController(finishMeasurementVC, animated: true);
        finishMeasurementVC.customer = self.customer;
    }
    
    //MARK: tableView
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("finishMeasurementCellId") as! FinishMeasurementSimpleCell;
        cell.nameLabel.text = self.finishMeasurements[indexPath.row].name;
        return cell;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.finishMeasurements.count;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let finishMeasurementVC = UIStoryboard(name: "Measurements", bundle: nil).instantiateViewControllerWithIdentifier("finishMeasurementId") as! FinishMeasurementsViewController;
        self.navigationController?.pushViewController(finishMeasurementVC, animated: true);
        finishMeasurementVC.customer = self.customer;
        finishMeasurementVC.finishMeasurement = self.finishMeasurements[indexPath.row];
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 55;
    }
}
