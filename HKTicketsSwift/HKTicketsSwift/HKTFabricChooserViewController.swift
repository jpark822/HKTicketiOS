//
//  HKTFabricChooserViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 5/6/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit

class HKTFabricChooserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var addFabricButton: UIButton!
    @IBOutlet weak var doneAddingButton: UIButton!
    
    var delegate : OrderFormDelegate?;
    @IBOutlet weak var fabricTextBox: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var fabrics : [String] = [];
    var itemType : OrderItemType = OrderItemType.Shirt;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        self.addFabricButton.backgroundColor = UIColor.HKTRed();
        self.addFabricButton.layer.cornerRadius = HKTStyling.cornerRadiusMedium;
        self.doneAddingButton.backgroundColor = UIColor.HKTRed();
        self.doneAddingButton.layer.cornerRadius = HKTStyling.cornerRadiusMedium;
    }
    
    override func viewDidAppear(animated: Bool) {
        self.fabricTextBox.becomeFirstResponder();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addFabricButtonPressed(sender: AnyObject) {
        let trimmedString = self.fabricTextBox.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet());
        if (trimmedString.characters.count > 0)
        {
            fabrics.append(trimmedString);
            self.fabricTextBox.text = "";
            self.tableView.reloadData();
        }
    }

    @IBAction func donAddingFabricsPressed(sender: AnyObject) {
        switch (self.itemType) {
        case OrderItemType.Shirt:
            if (self.fabrics.count > 0) {
                let shirtOrderForm = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("shirtOrderFormId") as! ShirtOrderFormViewController;
                shirtOrderForm.fabrics = self.fabrics;
                shirtOrderForm.delegate = self.delegate;
                self.navigationController?.pushViewController(shirtOrderForm, animated: true);
            }
        case OrderItemType.Pants:
            if (self.fabrics.count > 0) {
                let pantsOrderForm = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("PantsOrderFormID") as! PantsOrderFormViewController;
                pantsOrderForm.fabrics = self.fabrics;
                pantsOrderForm.delegate = self.delegate;
                self.navigationController?.pushViewController(pantsOrderForm, animated: true);
            }
        case OrderItemType.Jacket:
            if (self.fabrics.count > 0) {
                let jacketOrderForm = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("jacketOrderFormId") as! JacketOrderFormViewController;
                jacketOrderForm.fabrics = self.fabrics;
                jacketOrderForm.delegate = self.delegate;
                self.navigationController?.pushViewController(jacketOrderForm, animated: true);
            }
        case OrderItemType.Vest:
            if (self.fabrics.count > 0) {
                let vestOrderForm = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("vestOrderFormId") as! VestOrderFormViewController;
                vestOrderForm.fabrics = self.fabrics;
                vestOrderForm.delegate = self.delegate;
                self.navigationController?.pushViewController(vestOrderForm, animated: true);
            }
        default:
            NSLog("nothing");
        }
    }
    @IBAction func backButtonPressed(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true);
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let fabricCell = tableView.dequeueReusableCellWithIdentifier("fabricCellId") as! AddFabricTableViewCell;
        fabricCell.fabricNameLabel.text = self.fabrics[indexPath.row];
        return fabricCell;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fabrics.count;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true;
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        self.fabrics.removeAtIndex(indexPath.row);
        self.tableView.reloadData();
    }
}
