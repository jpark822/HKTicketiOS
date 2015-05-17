//
//  HKTFabricChooserViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 5/6/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit

class HKTFabricChooserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var delegate : OrderFormDelegate?;
    @IBOutlet weak var fabricTextBox: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var fabrics : [String] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addFabricButtonPressed(sender: AnyObject) {
        let trimmedString = self.fabricTextBox.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet());
        if (count(trimmedString) > 0)
        {
            fabrics.append(trimmedString);
            self.fabricTextBox.text = "";
            self.tableView.reloadData();
        }
    }

    @IBAction func donAddingFabricsPressed(sender: AnyObject) {
        if (self.fabrics.count > 0) {
            var shirtOrderForm = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("shirtOrderFormId") as! ShirtOrderFormViewController;
            shirtOrderForm.fabrics = self.fabrics;
            shirtOrderForm.delegate = self.delegate;
            self.navigationController?.pushViewController(shirtOrderForm, animated: true);
        }
    }
    @IBAction func backButtonPressed(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true);
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var fabricCell = tableView.dequeueReusableCellWithIdentifier("fabricCellId") as! AddFabricTableViewCell;
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
