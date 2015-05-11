//
//  HKTOrderFormViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 5/6/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit

class HKTOrderFormViewController: UIViewController, OrderFormDelegate, UITableViewDelegate, UITableViewDataSource {
    
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
        let shirtNavController = UINavigationController(rootViewController: fabricVC);
        self.navigationController?.presentViewController(shirtNavController, animated: true, completion: { () -> Void in
            
        });
//        self.navigationController!.pushViewController(fabricVC, animated: true);
        
    }
    
    func didFinishCustomizing(items: [OrderItemInterface]) {
        orderItems += items;
        self.tableView.reloadData();
    }
    
    func didFinishCustomizingShirts(items: [ShirtOrderInfo]) {
        for shirt in items {
            self.orderItems.append(shirt);
        }
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
}
