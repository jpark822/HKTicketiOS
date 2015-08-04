//
//  VestOrderFormViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 6/1/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit

class VestOrderFormViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITextFieldDelegate {
    
    @IBOutlet weak var customerNameLabel: UILabel!

    @IBOutlet weak var fabricTextField: UITextField!
    @IBOutlet weak var vestCollectionView: UICollectionView!
    @IBOutlet weak var firstButtonTextField: UITextField!
    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var moveToMeasurementsButton: UIButton!
    
    var vestOptions : [VestOrderInfo.VestType] = [VestOrderInfo.VestType.V1,
        VestOrderInfo.VestType.V4,
        VestOrderInfo.VestType.V6,
        VestOrderInfo.VestType.V8,
        VestOrderInfo.VestType.V12,
        VestOrderInfo.VestType.Other];
    
    var existingVestOrder : VestOrderInfo?;
    var fabrics : [String]?;
    
    var delegate : OrderFormDelegate?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customerNameLabel.text = "\(self.delegate?.getCustomer().firstName) \(self.delegate?.getCustomer().lastName)"
        self.noteTextView.layer.borderColor = UIColor.blackColor().CGColor;
        self.noteTextView.layer.borderWidth = 1;
        self.moveToMeasurementsButton.layer.cornerRadius = HKTStyling.cornerRadiusMedium;
        
        self.fabricTextField.delegate = self;
        self.firstButtonTextField.delegate = self;
        
        let orderItemCellNib = UINib(nibName: "OrderItemCell", bundle: nil);
        self.vestCollectionView.registerNib(orderItemCellNib, forCellWithReuseIdentifier: "orderOptionCellId");
        self.vestCollectionView.delegate = self;
        self.vestCollectionView.dataSource = self;
        
        if self.existingVestOrder != nil {
            self.setupControlsWithEditableVestInfo()
        }
        else {
            self.vestCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
            self.navigationItem.rightBarButtonItem = nil;
        }
    }
    
    func setupControlsWithEditableVestInfo() {
        self.fabricTextField.text = self.existingVestOrder?.fabric;
        self.fabricTextField.hidden = false;
        self.noteTextView.text = self.existingVestOrder?.notes;
        self.firstButtonTextField.text = self.existingVestOrder?.firstButtonPosition;
        
        if let vestTypeIndex = self.vestOptions.indexOf(self.existingVestOrder!.vestType) {
            self.vestCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: vestTypeIndex, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        }
    }

    @IBAction func doneButtonPressed(sender: AnyObject) {
        if let fabrics = self.fabrics {
            var orders : [VestOrderInfo]! = []
            
            for fabric in fabrics {
                let vestOrder = VestOrderInfo();
                vestOrder.fabric = fabric;
                
                var selectedVestTypeIndexes = self.vestCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
                vestOrder.vestType = self.vestOptions[selectedVestTypeIndexes[0].row];
                vestOrder.firstButtonPosition = self.firstButtonTextField.text!;
                vestOrder.notes = self.noteTextView.text;
                
                orders.append(vestOrder);
            }
            let vestMeasurementsVC = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("vestMeasurementId") as! VestMeasurementViewController;
            vestMeasurementsVC.delegate = self.delegate;
            vestMeasurementsVC.vestOrders = orders;
            self.navigationController?.pushViewController(vestMeasurementsVC, animated: true);
        }
        else if let existingVest = self.existingVestOrder {
            self.collectFormDataAndUpdateExistingPants();
            
            let vestMeasurementsVC = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("vestMeasurementId") as! VestMeasurementViewController;
            vestMeasurementsVC.delegate = self.delegate;
            vestMeasurementsVC.existingVest = existingVest;
            self.navigationController?.pushViewController(vestMeasurementsVC, animated: true);
        }
    }
    
    func collectFormDataAndUpdateExistingPants() {
        if let existingVest = self.existingVestOrder {
            existingVest.fabric = self.fabricTextField.text!;
            var selectedVestTypeIndexes = self.vestCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
            existingVest.vestType = self.vestOptions[selectedVestTypeIndexes[0].row];
            existingVest.firstButtonPosition = self.firstButtonTextField.text!;
            existingVest.notes = self.noteTextView.text;
        }
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true);
    }
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        self.collectFormDataAndUpdateExistingPants();
    }

    //MARK: collection view delegate and data source
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let orderOptionCell = collectionView.dequeueReusableCellWithReuseIdentifier("orderOptionCellId", forIndexPath: indexPath) as! OrderOptionCell;
        orderOptionCell.configureCellWithOption(vestOptions[indexPath.row]);
        return orderOptionCell;
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.vestOptions.count;
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(135, 135);
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
    
}
