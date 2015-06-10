//
//  JacketOrderFormViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 6/1/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit

class JacketOrderFormViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,UITextViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fabricTextField: UITextField!
    @IBOutlet weak var lapelCollectionView: UICollectionView!
    @IBOutlet weak var lapelWidthTextField: UITextField!
    @IBOutlet weak var liningCollectionView: UICollectionView!
    @IBOutlet weak var buttonCollectionView: UICollectionView!
    @IBOutlet weak var firstButtonTextField: UITextField!
    @IBOutlet weak var pocketsCollectionView: UICollectionView!
    @IBOutlet weak var ticketPocketSwitch: UISwitch!
    @IBOutlet weak var flapWidthTextField: UITextField!
    @IBOutlet weak var ventCollectionView: UICollectionView!
    @IBOutlet weak var stitchCollectionView: UICollectionView!
    @IBOutlet weak var buttonHoleLapelSwitch: UISwitch!
    @IBOutlet weak var cuffsCollectionView: UICollectionView!
    @IBOutlet weak var paddingSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var notesTextView: UITextView!
    var lapelOptions : [JacketOrderInfo.Lapel] = [JacketOrderInfo.Lapel.Notch,
    JacketOrderInfo.Lapel.Peak,
    JacketOrderInfo.Lapel.Shawl,
    JacketOrderInfo.Lapel.Other];
    var liningOptions : [JacketOrderInfo.Lining] = [JacketOrderInfo.Lining.Full,
    JacketOrderInfo.Lining.Quarter,
    JacketOrderInfo.Lining.Unconstructed];
    var paddingOptions : [JacketOrderInfo.Padding] = [JacketOrderInfo.Padding.Light,
    JacketOrderInfo.Padding.Medium,
    JacketOrderInfo.Padding.Heavy,
    JacketOrderInfo.Padding.NotApplicable];
    var buttonOptions : [JacketOrderInfo.Buttons] = [JacketOrderInfo.Buttons.Single,
    JacketOrderInfo.Buttons.Two,
    JacketOrderInfo.Buttons.Three,
    JacketOrderInfo.Buttons.DoubleBreasted];
    var pocketOptions : [JacketOrderInfo.Pockets] = [JacketOrderInfo.Pockets.Regular,
    JacketOrderInfo.Pockets.Slanted];
    var ventOptions : [JacketOrderInfo.Vent] = [JacketOrderInfo.Vent.None,
    JacketOrderInfo.Vent.Center,
    JacketOrderInfo.Vent.Side];
    var stitchOptions : [JacketOrderInfo.Stitch] = [JacketOrderInfo.Stitch.None,
    JacketOrderInfo.Stitch.Hand,
    JacketOrderInfo.Stitch.QuarterMachine];
    var cuffsOptions : [JacketOrderInfo.Cuffs] = [JacketOrderInfo.Cuffs.ButtonholeReady,
    JacketOrderInfo.Cuffs.Functional];
    
    var existingJacketOrder : JacketOrderInfo?;
    var fabrics : [String]?;
    
    var delegate : OrderFormDelegate?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.notesTextView.layer.borderColor = UIColor.blackColor().CGColor;
        self.notesTextView.layer.borderWidth = 1;
        self.scrollView.contentSize = CGSizeMake(768, 2500);
        
        let orderItemCellNib = UINib(nibName: "OrderItemCell", bundle: nil);
        self.lapelCollectionView.registerNib(orderItemCellNib, forCellWithReuseIdentifier: "orderOptionCellId");
        self.lapelCollectionView.delegate = self;
        self.lapelCollectionView.dataSource = self;
        self.liningCollectionView.registerNib(orderItemCellNib, forCellWithReuseIdentifier: "orderOptionCellId");
        self.liningCollectionView.delegate = self;
        self.liningCollectionView.dataSource = self;
        self.buttonCollectionView.registerNib(orderItemCellNib, forCellWithReuseIdentifier: "orderOptionCellId");
        self.buttonCollectionView.delegate = self;
        self.buttonCollectionView.dataSource = self;
        self.pocketsCollectionView.registerNib(orderItemCellNib, forCellWithReuseIdentifier: "orderOptionCellId");
        self.pocketsCollectionView.delegate = self;
        self.pocketsCollectionView.dataSource = self;
        self.ventCollectionView.registerNib(orderItemCellNib, forCellWithReuseIdentifier: "orderOptionCellId");
        self.ventCollectionView.delegate = self;
        self.ventCollectionView.dataSource = self;
        self.stitchCollectionView.registerNib(orderItemCellNib, forCellWithReuseIdentifier: "orderOptionCellId");
        self.stitchCollectionView.delegate = self;
        self.stitchCollectionView.dataSource = self;
        self.cuffsCollectionView.registerNib(orderItemCellNib, forCellWithReuseIdentifier: "orderOptionCellId");
        self.cuffsCollectionView.delegate = self;
        self.cuffsCollectionView.dataSource = self;
        
        self.notesTextView.delegate = self;
        
        if let existingOrder = self.existingJacketOrder {
            self.setupControlsWithEditableJacketInfo()
            self.fabricTextField.hidden = false;
        }
        else {
            self.lapelCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
            self.liningCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
            self.buttonCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
            self.pocketsCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
            self.ventCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
            self.stitchCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
            self.cuffsCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
            self.navigationItem.rightBarButtonItem = nil;
        }
    }
    
    func setupControlsWithEditableJacketInfo() {
        self.fabricTextField.text = self.existingJacketOrder?.fabric;
        self.fabricTextField.hidden = false;
        self.notesTextView.text = self.existingJacketOrder?.notes;
        self.firstButtonTextField.text = self.existingJacketOrder?.firstButtonPosition;
        self.ticketPocketSwitch.on = self.existingJacketOrder!.ticketPocket;
        self.flapWidthTextField.text = self.existingJacketOrder?.flapWidth;
        self.buttonHoleLapelSwitch.on = self.existingJacketOrder!.buttonHoleOnLapel;
        if let lapelIndex = self.lapelOptions.indexOf(self.existingJacketOrder!.lapel) {
            self.lapelCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: lapelIndex, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        }
        self.lapelWidthTextField.text = self.existingJacketOrder!.lapelWidth;
        if let liningIndex = self.liningOptions.indexOf(self.existingJacketOrder!.lining) {
            self.liningCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: liningIndex, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        }
        if let paddingIndex = self.paddingOptions.indexOf(self.existingJacketOrder!.padding) {
            self.paddingSegmentedControl.selectedSegmentIndex = paddingIndex;
        }
        if let buttonIndex = self.buttonOptions.indexOf(self.existingJacketOrder!.buttons) {
            self.buttonCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: buttonIndex, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        }
        if let pocketIndex = self.pocketOptions.indexOf(self.existingJacketOrder!.pockets) {
            self.pocketsCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: pocketIndex, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        }
        if let ventIndex = self.ventOptions.indexOf(self.existingJacketOrder!.vent) {
            self.ventCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: ventIndex, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        }
        if let stitchIndex = self.stitchOptions.indexOf(self.existingJacketOrder!.stitch) {
            self.stitchCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: stitchIndex, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        }
        if let cuffIndex = self.cuffsOptions.indexOf(self.existingJacketOrder!.cuffs) {
            self.cuffsCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: cuffIndex, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        }
    }

    @IBAction func backButtonPressed(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true);
    }

    @IBAction func saveButtonPressed(sender: AnyObject) {
        self.collectFormDataAndUpdateExistingPants();
    }
    
    func collectFormDataAndUpdateExistingPants() {
        if let existingJacket = self.existingJacketOrder {
            existingJacket.fabric = self.fabricTextField.text!;
            
            var selectedLapelIndexes = self.lapelCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
            existingJacket.lapel = self.lapelOptions[selectedLapelIndexes[0].row];
            var selectedLiningIndexes = self.liningCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
            existingJacket.lining = self.liningOptions[selectedLiningIndexes[0].row];
            var selectedButtonIndexes = self.buttonCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
            existingJacket.buttons = self.buttonOptions[selectedButtonIndexes[0].row];
            var selectedPocketIndexes = self.pocketsCollectionView.indexPathsForSelectedItems() as! [NSIndexPath]!;
            existingJacket.pockets = self.pocketOptions[selectedPocketIndexes[0].row];
            var selectedVentIndexes = self.ventCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
            existingJacket.vent = self.ventOptions[selectedVentIndexes[0].row];
            var selectedStitchIndexes = self.stitchCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
            existingJacket.stitch = self.stitchOptions[selectedStitchIndexes[0].row];
            var selectedCuffIndexes = self.cuffsCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
            existingJacket.cuffs = self.cuffsOptions[selectedCuffIndexes[0].row];
            
            existingJacket.lapelWidth = self.lapelWidthTextField.text!;
            existingJacket.firstButtonPosition = self.firstButtonTextField.text!;
            existingJacket.ticketPocket = self.ticketPocketSwitch.on;
            existingJacket.padding = self.paddingOptions[self.paddingSegmentedControl.selectedSegmentIndex];
            existingJacket.flapWidth = self.flapWidthTextField.text!;
            existingJacket.buttonHoleOnLapel = self.buttonHoleLapelSwitch.on;
            existingJacket.notes = self.notesTextView.text;
        }
    }
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        if let fabrics = self.fabrics {
            var orders : [JacketOrderInfo] = [];
            
            for fabric in fabrics {
                var jacketOrder = JacketOrderInfo();
                jacketOrder.fabric = fabric;
                
                var selectedLapelIndexes = self.lapelCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
                jacketOrder.lapel = self.lapelOptions[selectedLapelIndexes[0].row];
                var selectedLiningIndexes = self.liningCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
                jacketOrder.lining = self.liningOptions[selectedLiningIndexes[0].row];
                var selectedButtonIndexes = self.buttonCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
                jacketOrder.buttons = self.buttonOptions[selectedButtonIndexes[0].row];
                var selectedPocketIndexes = self.pocketsCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
                jacketOrder.pockets = self.pocketOptions[selectedPocketIndexes[0].row];
                var selectedVentIndexes = self.ventCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
                jacketOrder.vent = self.ventOptions[selectedVentIndexes[0].row];
                var selectedStitchIndexes = self.stitchCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
                jacketOrder.stitch = self.stitchOptions[selectedStitchIndexes[0].row];
                var selectedCuffIndexes = self.cuffsCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
                jacketOrder.cuffs = self.cuffsOptions[selectedCuffIndexes[0].row];
                
                jacketOrder.lapelWidth = self.lapelWidthTextField.text!;
                jacketOrder.firstButtonPosition = self.firstButtonTextField.text!;
                jacketOrder.ticketPocket = self.ticketPocketSwitch.on;
                jacketOrder.padding = self.paddingOptions[self.paddingSegmentedControl.selectedSegmentIndex];
                jacketOrder.flapWidth = self.flapWidthTextField.text!;
                jacketOrder.buttonHoleOnLapel = self.buttonHoleLapelSwitch.on;
                jacketOrder.notes = self.notesTextView.text;
                
                orders.append(jacketOrder);
            }
            var jacketMeasurementsVC = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("jacketMeasurementsId") as! JacketMeasurementsViewController;
            jacketMeasurementsVC.jacketOrders = orders;
            jacketMeasurementsVC.delegate = self.delegate;
            self.navigationController?.pushViewController(jacketMeasurementsVC, animated: true);
        }
        else if let existingJacket = self.existingJacketOrder {
            self.collectFormDataAndUpdateExistingPants();
            
            var jacketMeasurementsVC = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("jacketMeasurementsId") as! JacketMeasurementsViewController;
            jacketMeasurementsVC.existingJacket = existingJacket;
            jacketMeasurementsVC.delegate = self.delegate;
            self.navigationController?.pushViewController(jacketMeasurementsVC, animated: true);
        }
    }
    
    //MARK: collection view delegate and data source
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let orderOptionCell = collectionView.dequeueReusableCellWithReuseIdentifier("orderOptionCellId", forIndexPath: indexPath) as! OrderOptionCell;
        
        switch collectionView {
        case self.lapelCollectionView:
            orderOptionCell.configureCellWithOption(self.lapelOptions[indexPath.row]);
        case self.liningCollectionView:
            orderOptionCell.configureCellWithOption(self.liningOptions[indexPath.row]);
        case self.buttonCollectionView:
            orderOptionCell.configureCellWithOption(self.buttonOptions[indexPath.row]);
        case self.pocketsCollectionView:
            orderOptionCell.configureCellWithOption(self.pocketOptions[indexPath.row]);
        case self.ventCollectionView:
            orderOptionCell.configureCellWithOption(self.ventOptions[indexPath.row]);
        case self.stitchCollectionView:
            orderOptionCell.configureCellWithOption(self.stitchOptions[indexPath.row]);
        case self.cuffsCollectionView:
            orderOptionCell.configureCellWithOption(self.cuffsOptions[indexPath.row]);
        default:
            print("no item for option");
        }
        
        return orderOptionCell;
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.lapelCollectionView:
            return self.lapelOptions.count
        case self.liningCollectionView:
            return self.liningOptions.count
        case self.buttonCollectionView:
            return self.buttonOptions.count
        case self.pocketsCollectionView:
            return self.pocketOptions.count
        case self.ventCollectionView:
            return self.ventOptions.count
        case self.stitchCollectionView:
            return self.stitchOptions.count
        case self.cuffsCollectionView:
            return self.cuffsOptions.count
        default:
            return 0;
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(135, 135);
    }
    
    //MARK: text view delegate
    func textViewDidBeginEditing(textView: UITextView) {
        keyboardWillShow()
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        keyboardWillHide();
    }
    
    func keyboardWillShow() {
        var frame = self.view.frame;
        frame.origin.y -= 264;
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.view.frame = frame;
            }, completion: nil)
        
    }
    
    func keyboardWillHide() {
        var frame = self.view.frame;
        frame.origin.y += 264;
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.view.frame = frame;
            }, completion: nil)
    }
}
