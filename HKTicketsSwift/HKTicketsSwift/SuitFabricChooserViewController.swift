//
//  SuitFabricChooserViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 6/9/15.
//  Copyright © 2015 JPApps. All rights reserved.
//

import UIKit

class SuitFabricChooserViewController: UIViewController, SuitFabricModalDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var delegate : OrderFormDelegate?;
    @IBOutlet weak var tableView: UITableView!
    
    var suitFabricUnits : [SuitFabricUnit] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }


    @IBAction func addFabricPressed(sender: AnyObject) {
        let modal = UIStoryboard(name: "SuitOrder", bundle: nil).instantiateViewControllerWithIdentifier("suitFabricModalId") as! SuitFabricModalViewController;
        modal.delegate = self;
        modal.modalPresentationStyle = UIModalPresentationStyle.FormSheet;
        modal.preferredContentSize = CGSizeMake(500, 310);
        self.presentViewController(modal, animated: true, completion: nil);
    }
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        if (self.suitFabricUnits.count > 0) {
            let suitOrderVC = UIStoryboard(name: "SuitOrder", bundle: nil).instantiateViewControllerWithIdentifier("suitOrderFormId") as! SuitOrderFormViewController;
            suitOrderVC.fabrics = self.suitFabricUnits;
            suitOrderVC.delegate = self.delegate;
            self.navigationController?.pushViewController(suitOrderVC, animated: true);
        }
    }
    
    
    func suitFabricModalFinishedAddingFabrics(suit: String, vest: String?) {
        let fabric = SuitFabricUnit(suitFabric: suit, vestFabric: vest);
        self.suitFabricUnits.append(fabric);
        self.tableView.reloadData();
    }
    
    //MARK: tableview
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("suitFabricCellId") as! SuitFabricTableViewCell;
        cell.configureWithSuitFabricUnit(self.suitFabricUnits[indexPath.row]);
        return cell;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 187;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.suitFabricUnits.count;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
}
