//
//  PantsOrderFormViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 5/25/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit

class PantsOrderFormViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITextFieldDelegate {
    @IBOutlet weak var customerNameLabel: UILabel!

    @IBOutlet weak var pleatCollectionView: UICollectionView!
    @IBOutlet weak var extensionSwitch: UISwitch!
    @IBOutlet weak var liningSegmentedControl: UISegmentedControl!
    @IBOutlet weak var depthOfPleatTextField: UITextField!
    @IBOutlet weak var fabricTextField: UITextField!
    @IBOutlet weak var notesTextField: UITextView!
    
    var pleatOptions : [PantsOrderInfo.Pleat] = [PantsOrderInfo.Pleat.FlatFront, PantsOrderInfo.Pleat.Single, PantsOrderInfo.Pleat.Double];
    var liningOptions : [PantsOrderInfo.Lining] = [PantsOrderInfo.Lining.Front, PantsOrderInfo.Lining.Full, PantsOrderInfo.Lining.None];
    
    var existingPantOrder : PantsOrderInfo?;
    var fabrics : [String]?;
    
    var delegate : OrderFormDelegate?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.notesTextField.layer.borderColor = UIColor.blackColor().CGColor;
        self.notesTextField.layer.borderWidth = 1;
        
        self.depthOfPleatTextField.delegate = self;
        self.fabricTextField.delegate = self;
        
        let orderItemCellNib = UINib(nibName: "OrderItemCell", bundle: nil);
        self.pleatCollectionView.registerNib(orderItemCellNib, forCellWithReuseIdentifier: "orderOptionCellId")
        self.pleatCollectionView.dataSource = self;
        self.pleatCollectionView.delegate = self;
        
        if let existingOrder = self.existingPantOrder {
            self.setupControlsWithEditablePantInfo();
            self.fabricTextField.hidden = false;
        }
        else {
            self.pleatCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
            self.navigationItem.rightBarButtonItem = nil;
        }
    }
    
    func setupControlsWithEditablePantInfo() {
        self.fabricTextField.text = self.existingPantOrder?.fabric;
        self.fabricTextField.hidden = false;
        self.depthOfPleatTextField.text = self.existingPantOrder?.depthOfPleat;
        
        if let pleatIndex = self.pleatOptions.indexOf(self.existingPantOrder!.pleat) {
            self.pleatCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: pleatIndex, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        }
        self.extensionSwitch.on = self.existingPantOrder!.addExtension;
        
        if let liningIndex = self.liningOptions.indexOf(self.existingPantOrder!.lining) {
            self.liningSegmentedControl.selectedSegmentIndex = liningIndex;
        }
        self.notesTextField.text = self.existingPantOrder?.notes;
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true);
    }
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        self.collectFormDataAndUpdateExistingPants();
    }

    @IBAction func doneButtonPressed(sender: AnyObject) {
        if let fabrics = self.fabrics {
            var orders : [PantsOrderInfo]! = []
            
            for fabric in fabrics {
                var pantOrder = PantsOrderInfo();
                pantOrder.fabric = fabric;
                var selectedPleatIndexes = self.pleatCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
                pantOrder.pleat = self.pleatOptions[selectedPleatIndexes[0].row];
                pantOrder.addExtension = self.extensionSwitch.on;
                pantOrder.lining = self.liningOptions[self.liningSegmentedControl.selectedSegmentIndex];
                pantOrder.depthOfPleat = self.depthOfPleatTextField.text!;
                pantOrder.notes = self.notesTextField.text;
                
                orders.append(pantOrder);
            }
            var pantMeasurementsVC = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("PantsMeasurementsControllerId") as! PantMeasurementViewController;
            pantMeasurementsVC.delegate = self.delegate;
            pantMeasurementsVC.pantOrders = orders;
            self.navigationController?.pushViewController(pantMeasurementsVC, animated: true);
        }
        else if let existingPant = self.existingPantOrder {
            collectFormDataAndUpdateExistingPants();
            
            var pantMeasurementsVC = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("PantsMeasurementsControllerId") as! PantMeasurementViewController;
            pantMeasurementsVC.delegate = self.delegate;
            pantMeasurementsVC.existingPants = self.existingPantOrder;
            self.navigationController?.pushViewController(pantMeasurementsVC, animated: true);
        }
    }
    
    func collectFormDataAndUpdateExistingPants() {
        if let existingPant = self.existingPantOrder {
            existingPant.fabric = self.fabricTextField.text!;
            var selectedPleatIndexes = self.pleatCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
            existingPant.pleat = self.pleatOptions[selectedPleatIndexes[0].row];
            existingPant.lining = self.liningOptions[self.liningSegmentedControl.selectedSegmentIndex];
            existingPant.depthOfPleat = self.depthOfPleatTextField.text!;
            existingPant.notes = self.notesTextField.text;
            existingPant.addExtension = self.extensionSwitch.on;
        }
    }
    
    //MARK: collection view delegate and data source
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let orderOptionCell = collectionView.dequeueReusableCellWithReuseIdentifier("orderOptionCellId", forIndexPath: indexPath) as! OrderOptionCell;
        orderOptionCell.configureCellWithOption(pleatOptions[indexPath.row]);
        return orderOptionCell;
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pleatOptions.count;
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(135, 135);
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }

}
