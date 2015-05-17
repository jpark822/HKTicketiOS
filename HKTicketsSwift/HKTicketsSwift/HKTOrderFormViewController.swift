//
//  HKTOrderFormViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 5/6/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit
import MessageUI

class HKTOrderFormViewController: UIViewController, OrderFormDelegate, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var orderItems : [OrderItemInterface] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
    }

    @IBAction func addShirtButtonPressed(sender: UIButton) {
        var fabricVC = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("FabricChooserViewControllerID") as! HKTFabricChooserViewController;
        fabricVC.delegate = self;
        self.navigationController?.pushViewController(fabricVC, animated: true);
//        let shirtNavController = UINavigationController(rootViewController: fabricVC);
//        self.navigationController?.presentViewController(shirtNavController, animated: true, completion: { () -> Void in
//        });        
    }
    
    func didFinishCustomizingShirts(items: [ShirtOrderInfo]) {
        for shirt in items {
            self.orderItems.append(shirt);
        }
        self.tableView.reloadData();
    }
    
    func didFinishEditingShirt(shirt: ShirtOrderInfo) {
        self.tableView.reloadData();
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("orderFormCellId") as! OrderFormItemCell;
        cell.fabricLabel.text = self.orderItems[indexPath.row].fabric;
        cell.typeLabel.text = self.orderItems[indexPath.row].itemType.rawValue;
        
        return cell;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderItems.count;
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true;
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        self.orderItems.removeAtIndex(indexPath.row);
        self.tableView.reloadData();
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var shirtOrderForm = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("shirtOrderFormId") as! ShirtOrderFormViewController;
        shirtOrderForm.editShirtinfo = self.orderItems[indexPath.row] as? ShirtOrderInfo;
        shirtOrderForm.delegate = self;
        var navController = UINavigationController(rootViewController: shirtOrderForm);
//        self.navigationController!.presentViewController(shirtOrderForm, animated: true, completion: nil);
        self.navigationController?.pushViewController(shirtOrderForm, animated: true);
    }
    
    func getBodyMeasurements() -> BodyMeasurements {
        return BodyMeasurements();
    }
    
    func getShirtFinishMeasurements() -> ShirtFinishMeasurements {
        return ShirtFinishMeasurements();
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    @IBAction func completeOrderButtonPressed(sender: AnyObject) {
        var orderString = "";
        for orderItem in self.orderItems {
            orderString += orderItem.convertToMailingString();
            orderString += "\n";
        }
        var mailComposer = MFMailComposeViewController();
        mailComposer.setMessageBody(orderString, isHTML: false)
        mailComposer.mailComposeDelegate = self;
        self.presentViewController(mailComposer, animated: true, completion: nil);
        
    }
    
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        if (result.value == MFMailComposeResultSent.value || result.value == MFMailComposeResultSaved.value) {
            controller.dismissViewControllerAnimated(true, completion: { () -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)
            })
        }
        
        else {
            controller.dismissViewControllerAnimated(true, completion: nil);
        }
    }
}
