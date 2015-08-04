//
//  HKTOrderFormViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 5/6/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit
import MessageUI

protocol OrderFormViewControllerDelegate {
    func OrderFormViewControllerDidFinishOrder()
}

class HKTOrderFormViewController: UIViewController, OrderFormDelegate, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate, UITextFieldDelegate, CustomerMeasurementChooserDelegate {
    
    @IBOutlet weak var addShirtButton: UIButton!
    @IBOutlet weak var addPantsButton: UIButton!
    @IBOutlet weak var addJacketButton: UIButton!
    @IBOutlet weak var addVestButton: UIButton!
    @IBOutlet weak var addSuitButton: UIButton!
    
    @IBOutlet weak var completeOrderButton: UIButton!
    @IBOutlet weak var oldOrderNumberTextField: UITextField!
    @IBOutlet weak var newOrderNumberTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var customer : Customer = Customer();
    
    var delegate : OrderFormViewControllerDelegate?
    
    var orderItems : [OrderItemInterface] = [];
    
    var selectedItemType : OrderItemType? = nil;
    
    var finishMeasurements : [FinishMeasurements] = [];
    var bodyMeasurements : BodyMeasurements = BodyMeasurements();
    var selectedFinishMeasurementIndex = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Custom Order For \(self.customer.firstName) \(self.customer.lastName)";
        
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        
        self.oldOrderNumberTextField.delegate = self;
        self.newOrderNumberTextField.delegate = self;
        
        self.addShirtButton.layer.cornerRadius = HKTStyling.cornerRadiusMedium;
        self.addPantsButton.layer.cornerRadius = HKTStyling.cornerRadiusMedium;
        self.addVestButton.layer.cornerRadius = HKTStyling.cornerRadiusMedium;
        self.addJacketButton.layer.cornerRadius = HKTStyling.cornerRadiusMedium;
        self.addSuitButton.layer.cornerRadius = HKTStyling.cornerRadiusMedium;
        self.completeOrderButton.layer.cornerRadius = HKTStyling.cornerRadiusMedium;
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action:"mainViewTapped" );
        self.view.addGestureRecognizer(tapRecognizer);
        self.getMeasurements();
        
    }
    
    func getMeasurements() {
        ServiceManager.sharedManager.getBodyMeasurementsByCustomerId(self.customer.customerId, success: { (bodyMeasurements : BodyMeasurements) -> () in
            self.bodyMeasurements = bodyMeasurements;
            }, failure: { (error : NSError!) -> () in
                NSLog(error.description);
        })
        ServiceManager.sharedManager.getFinishMeasurementsByCustomerId(self.customer.customerId, success: { (finishMeasurements : [FinishMeasurements]) -> () in
            self.finishMeasurements = finishMeasurements;
            }) { (error : NSError!) -> () in
                NSLog(error.description);
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData();
    }
    
    func mainViewTapped() {
        self.oldOrderNumberTextField.resignFirstResponder();
        self.newOrderNumberTextField.resignFirstResponder();
    }

    @IBAction func addShirtButtonPressed(sender: UIButton) {
        self.selectedItemType = OrderItemType.Shirt;
        self.presentMeasurementsModal();
    }
    
    @IBAction func addPantsButtonPressed(sender: AnyObject) {
        self.selectedItemType = OrderItemType.Pants;
        self.presentMeasurementsModal();
    }

    @IBAction func addVestButtonPressed(sender: AnyObject) {
        self.selectedItemType = OrderItemType.Vest;
        self.presentMeasurementsModal();
    }
    
    @IBAction func addJacketButtonPressed(sender: AnyObject) {
        self.selectedItemType = OrderItemType.Jacket;
        self.presentMeasurementsModal();
    }
    
    @IBAction func addSuitPressed(sender: AnyObject) {
        self.selectedItemType = OrderItemType.Suit;
        self.presentMeasurementsModal();
    }
    
    //MARK: OrderFormDelegate methods
    func didFinishCustomizingShirts(items: [ShirtOrderInfo]) {
        for shirt in items {
            self.orderItems.append(shirt);
        }
        self.tableView.reloadData();
    }
    
    func didFinishEditingShirt(shirt: ShirtOrderInfo) {
        self.tableView.reloadData();
    }
    
    func didFinishCustomizingPants(items: [PantsOrderInfo]) {
        for pants in items {
            self.orderItems.append(pants);
        }
        self.tableView.reloadData();
    }
    
    func didFinishEditingPants(shirt: PantsOrderInfo) {
        self.tableView.reloadData();
    }
    
    func didFinishCustomizingVests(items: [VestOrderInfo]) {
        for vest in items {
            self.orderItems.append(vest);
        }
    }
    
    func didFinishEditingVest(vest: VestOrderInfo) {
        self.tableView.reloadData();
    }
    
    func didFinishCustomizingJackets(items: [JacketOrderInfo]) {
        for jacket in items {
            self.orderItems.append(jacket);
        }
        self.tableView.reloadData();
    }
    
    func didFinishEditingJacket(vest: JacketOrderInfo) {
        self.tableView.reloadData();
    }
    
    func didFinishCustomizingSuits(items: [SuitOrderInfo]) {
        for suit in items {
            self.orderItems.append(suit);
        }
        self.tableView.reloadData();
    }
    
    func didFinishEditingSuit(suit: SuitOrderInfo) {
        self.tableView.reloadData();
    }
    
    func getBodyMeasurements() -> BodyMeasurements {
        let body = BodyMeasurements();
        body.chest = "1";
        body.waist = "2";
        body.hips = "3";
        body.shoulders = "4";
        body.seat = "18";
        body.crotch = "19";
        body.actualThigh = "5";
        body.outseam = "6";
        body.inseam = "7";
        body.shirtSleeveLength = "8";
        body.jacketSleeveLength = "9";
        body.shirtLength = "10";
        body.wrist = "11";
        body.neckSize = "12";
        body.jacketLength = "13";
        body.jacketWidth = "14";
        body.bicep = "15";
        body.armHole = "16";
        body.belly = "17";
        return body;
    }
    
    func getCustomer() -> Customer {
        return self.customer;
    }
    
    func getFinishMeasurements() -> [FinishMeasurements] {
        return self.finishMeasurements;
    }
    
    func getInitialFinishMeasurements() -> FinishMeasurements {
        if (self.finishMeasurements.count == 0) {
            return FinishMeasurements();
        }
        else {
            return self.finishMeasurements[self.selectedFinishMeasurementIndex];
        }
    }
    
    //MARK: tableview methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("orderFormCellId") as! OrderFormItemCell;
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
        let item : OrderItemInterface = self.orderItems[indexPath.row];

        switch item.itemType {
        case OrderItemType.Shirt:
            let shirtOrderForm = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("shirtOrderFormId") as! ShirtOrderFormViewController;
            shirtOrderForm.editShirtinfo = item as? ShirtOrderInfo;
            shirtOrderForm.delegate = self;
            self.navigationController?.pushViewController(shirtOrderForm, animated: true);
        case OrderItemType.Pants:
            let pantsOrderForm = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("PantsOrderFormID") as! PantsOrderFormViewController;
            pantsOrderForm.existingPantOrder = item as? PantsOrderInfo
            pantsOrderForm.delegate = self;
            self.navigationController?.pushViewController(pantsOrderForm, animated: true);
        case OrderItemType.Vest:
            let vestOrderForm = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("vestOrderFormId") as! VestOrderFormViewController;
            vestOrderForm.existingVestOrder = item as? VestOrderInfo
            vestOrderForm.delegate = self;
            self.navigationController?.pushViewController(vestOrderForm, animated: true);
        case OrderItemType.Jacket:
            let jacketOrderForm = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("jacketOrderFormId") as! JacketOrderFormViewController;
            jacketOrderForm.existingJacketOrder = item as? JacketOrderInfo
            jacketOrderForm.delegate = self;
            self.navigationController?.pushViewController(jacketOrderForm, animated: true);
        case OrderItemType.Suit:
            let suitOrderVC = UIStoryboard(name: "SuitOrder", bundle: nil).instantiateViewControllerWithIdentifier("suitOrderFormId") as! SuitOrderFormViewController;
            suitOrderVC.existingSuit = item as? SuitOrderInfo
            suitOrderVC.delegate = self;
            self.navigationController?.pushViewController(suitOrderVC, animated: true);
        }
    }

//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let item : OrderItemInterface = self.orderItems[indexPath.row];
//        
//        switch item.itemType {
//        case OrderItemType.Shirt:
//            let shirtOrderForm = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("shirtOrderFormId") as! ShirtOrderFormViewController;
//            shirtOrderForm.editShirtinfo = item as? ShirtOrderInfo;
//            shirtOrderForm.delegate = self;
//            self.navigationController?.pushViewController(shirtOrderForm, animated: true);
//        case OrderItemType.Pants:
//            let pantsOrderForm = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("PantsOrderFormID") as! PantsOrderFormViewController;
//            pantsOrderForm.existingPantOrder = item as? PantsOrderInfo
//            pantsOrderForm.delegate = self;
//            self.navigationController?.pushViewController(pantsOrderForm, animated: true);
//        case OrderItemType.Vest:
//            let vestOrderForm = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("vestOrderFormId") as! VestOrderFormViewController;
//            vestOrderForm.existingVestOrder = item as? VestOrderInfo
//            vestOrderForm.delegate = self;
//            self.navigationController?.pushViewController(vestOrderForm, animated: true);
//        case OrderItemType.Jacket:
//            let jacketOrderForm = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("jacketOrderFormId") as! JacketOrderFormViewController;
//            jacketOrderForm.existingJacketOrder = item as? JacketOrderInfo
//            jacketOrderForm.delegate = self;
//            self.navigationController?.pushViewController(jacketOrderForm, animated: true);
//        case OrderItemType.Suit:
//            let suitOrderVC = UIStoryboard(name: "SuitOrder", bundle: nil).instantiateViewControllerWithIdentifier("suitOrderFormId") as! SuitOrderFormViewController;
//            suitOrderVC.existingSuit = item as? SuitOrderInfo
//            suitOrderVC.delegate = self;
//            
//        default:
//            
//            NSLog("no type");
//        }
//    }
    
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    @IBAction func completeOrderButtonPressed(sender: AnyObject) {
        var orderString = "";
        if (self.oldOrderNumberTextField.text!.characters.count > 0) {
            orderString += "Old Order Number: \(self.oldOrderNumberTextField.text) \n";
        }
        if (self.newOrderNumberTextField.text!.characters.count > 0) {
            orderString += "New Order Number: \(self.newOrderNumberTextField.text) \n\n";
        }
        for orderItem in self.orderItems {
            orderString += orderItem.convertToMailingString();
            orderString += "\n";
        }
        let mailComposer = MFMailComposeViewController();
        mailComposer.setMessageBody(orderString, isHTML: false)
        mailComposer.mailComposeDelegate = self;
        self.presentViewController(mailComposer, animated: true, completion: nil);
        
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        if (result.rawValue == MFMailComposeResultSent.rawValue || result.rawValue == MFMailComposeResultSaved.rawValue) {
            controller.dismissViewControllerAnimated(true, completion: { () -> Void in
                self.dismissViewControllerAnimated(true, completion: nil);
                self.delegate?.OrderFormViewControllerDidFinishOrder();
            })
        }
        
        else {
            controller.dismissViewControllerAnimated(true, completion: nil);
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
    
    func presentMeasurementsModal() {
        let measurementChooserVC = UIStoryboard(name: "Customer", bundle: nil).instantiateViewControllerWithIdentifier("customerMeasurementChooserModalId") as! CustomerMeasurementChooserModalViewController;
        measurementChooserVC.modalPresentationStyle = UIModalPresentationStyle.FormSheet;
        measurementChooserVC.preferredContentSize = CGSizeMake(450, 350);
        measurementChooserVC.delegate = self;
        measurementChooserVC.finishMeasurements = self.finishMeasurements;
        self.presentViewController(measurementChooserVC, animated: true, completion: nil);
    }
    
    func CustomerMeasurementChooserDidSelectIndex(index: NSInteger) {
        self.selectedFinishMeasurementIndex = index;
        if (self.presentedViewController != nil) {
            self.presentedViewController!.dismissViewControllerAnimated(true, completion: nil);
            self.presentFabricChooser(self.selectedItemType!);
        }
    }
    
    func presentFabricChooser(orderItemType : OrderItemType) {
        switch (orderItemType) {
        case OrderItemType.Shirt, OrderItemType.Pants, OrderItemType.Vest, OrderItemType.Jacket:
            let fabricVC = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("FabricChooserViewControllerID") as! HKTFabricChooserViewController;
            fabricVC.delegate = self;
            fabricVC.itemType = orderItemType;
            self.navigationController?.pushViewController(fabricVC, animated: true);
        case OrderItemType.Suit:
            let suitFabricVC = UIStoryboard(name: "SuitOrder", bundle: nil).instantiateViewControllerWithIdentifier("suitFabricChooserId") as! SuitFabricChooserViewController;
            suitFabricVC.delegate = self;
            self.navigationController?.pushViewController(suitFabricVC, animated: true);
        }
    }
}
