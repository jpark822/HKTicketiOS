//
//  HKTOrderFormViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 5/6/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit
import MessageUI

class HKTOrderFormViewController: UIViewController, OrderFormDelegate, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate, UITextFieldDelegate {
    @IBOutlet weak var addShirtButton: UIButton!
    @IBOutlet weak var addPantsButton: UIButton!
    @IBOutlet weak var addJacketButton: UIButton!
    @IBOutlet weak var addVestButton: UIButton!
    @IBOutlet weak var addSuitButton: UIButton!
    
    @IBOutlet weak var completeOrderButton: UIButton!
    @IBOutlet weak var oldOrderNumberTextField: UITextField!
    @IBOutlet weak var newOrderNumberTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var orderItems : [OrderItemInterface] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData();
    }
    
    func mainViewTapped() {
        self.oldOrderNumberTextField.resignFirstResponder();
        self.newOrderNumberTextField.resignFirstResponder();
    }

    @IBAction func addShirtButtonPressed(sender: UIButton) {
        let fabricVC = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("FabricChooserViewControllerID") as! HKTFabricChooserViewController;
        fabricVC.delegate = self;
        fabricVC.itemType = OrderItemType.Shirt;
        self.navigationController?.pushViewController(fabricVC, animated: true);
    }
    
    @IBAction func addPantsButtonPressed(sender: AnyObject) {
        let fabricVC = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("FabricChooserViewControllerID") as! HKTFabricChooserViewController;
        fabricVC.delegate = self;
        fabricVC.itemType = OrderItemType.Pants;
        self.navigationController?.pushViewController(fabricVC, animated: true);
    }

    @IBAction func addVestButtonPressed(sender: AnyObject) {
        let fabricVC = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("FabricChooserViewControllerID") as! HKTFabricChooserViewController;
        fabricVC.delegate = self;
        fabricVC.itemType = OrderItemType.Vest;
        self.navigationController?.pushViewController(fabricVC, animated: true);
    }
    
    @IBAction func addJacketButtonPressed(sender: AnyObject) {
        let fabricVC = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("FabricChooserViewControllerID") as! HKTFabricChooserViewController;
        fabricVC.delegate = self;
        fabricVC.itemType = OrderItemType.Jacket;
        self.navigationController?.pushViewController(fabricVC, animated: true);
    }
    
    @IBAction func addSuitPressed(sender: AnyObject) {
        let suitFabricVC = UIStoryboard(name: "SuitOrder", bundle: nil).instantiateViewControllerWithIdentifier("suitFabricChooserId") as! SuitFabricChooserViewController;
        suitFabricVC.delegate = self;
        self.navigationController?.pushViewController(suitFabricVC, animated: true);
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
        default:
            
            NSLog("no type");
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
        var mailComposer = MFMailComposeViewController();
        mailComposer.setMessageBody(orderString, isHTML: false)
        mailComposer.mailComposeDelegate = self;
        self.presentViewController(mailComposer, animated: true, completion: nil);
        
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        if (result.rawValue == MFMailComposeResultSent.rawValue || result.rawValue == MFMailComposeResultSaved.rawValue) {
            controller.dismissViewControllerAnimated(true, completion: { () -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)
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
}
