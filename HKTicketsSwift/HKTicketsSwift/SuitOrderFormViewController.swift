//
//  SuitOrderFormViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 6/10/15.
//  Copyright © 2015 JPApps. All rights reserved.
//

import UIKit

class SuitOrderFormViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITextViewDelegate, UITextFieldDelegate {
    var delegate : OrderFormDelegate?;
    
    //Jacket
    @IBOutlet weak var jacketFabricTextField: UITextField!
    @IBOutlet weak var lapelCollectionView: UICollectionView!
    @IBOutlet weak var lapelWidthTextField: UITextField!
    @IBOutlet weak var liningCollectionView: UICollectionView!
    @IBOutlet weak var buttonCollectionView: UICollectionView!
    @IBOutlet weak var jacketFirstButtonTextField: UITextField!
    @IBOutlet weak var pocketsCollectionView: UICollectionView!
    @IBOutlet weak var ticketPocketSwitch: UISwitch!
    @IBOutlet weak var flapWidthTextField: UITextField!
    @IBOutlet weak var ventCollectionView: UICollectionView!
    @IBOutlet weak var stitchCollectionView: UICollectionView!
    @IBOutlet weak var buttonHoleLapelSwitch: UISwitch!
    @IBOutlet weak var cuffsCollectionView: UICollectionView!
    @IBOutlet weak var paddingSegmentedControl: UISegmentedControl!
    @IBOutlet weak var extensionSwitch: UISwitch!
    
    var lapelOptions : [JacketOrderInfo.Lapel] = [JacketOrderInfo.Lapel.Notch,
        JacketOrderInfo.Lapel.Peak,
        JacketOrderInfo.Lapel.Shawl,
        JacketOrderInfo.Lapel.Other];
    var jacketLiningOptions : [JacketOrderInfo.Lining] = [JacketOrderInfo.Lining.Full,
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
    
    //Pants
    @IBOutlet weak var pantFabricTextField: UITextField!
    @IBOutlet weak var pleatCollectionView: UICollectionView!
    @IBOutlet weak var liningSegmentedControl: UISegmentedControl!
    @IBOutlet weak var depthOfPleatTextField: UITextField!
    
    var pleatOptions : [PantsOrderInfo.Pleat] = [PantsOrderInfo.Pleat.FlatFront, PantsOrderInfo.Pleat.Single, PantsOrderInfo.Pleat.Double];
    var pantsLiningOptions : [PantsOrderInfo.Lining] = [PantsOrderInfo.Lining.Front, PantsOrderInfo.Lining.Full, PantsOrderInfo.Lining.None];
    
    //Vest
    @IBOutlet weak var vestContainerView: UIView!
    @IBOutlet weak var vestFabricTextField: UITextField!
    @IBOutlet weak var vestCollectionView: UICollectionView!
    @IBOutlet weak var vestFirstButtonTextField: UITextField!
    
    var vestOptions : [VestOrderInfo.VestType] = [VestOrderInfo.VestType.V1,
        VestOrderInfo.VestType.V4,
        VestOrderInfo.VestType.V6,
        VestOrderInfo.VestType.V8,
        VestOrderInfo.VestType.V12,
        VestOrderInfo.VestType.Other];
    
    //Overall Suit
    @IBOutlet weak var overallNotesTextField: UITextView!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var NoteAndDoneButtonContainerView: UIView!
    @IBOutlet weak var moveToMeasurementsButton: UIButton!
    
    var existingSuit : SuitOrderInfo?;
    var fabrics : [SuitFabricUnit]?;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ticketPocketSwitch.onTintColor = UIColor.HKTRed();
        self.buttonHoleLapelSwitch.onTintColor = UIColor.HKTRed();
        self.extensionSwitch.onTintColor = UIColor.HKTRed();
        self.moveToMeasurementsButton.layer.cornerRadius = HKTStyling.cornerRadiusMedium;
        
        self.lapelWidthTextField.delegate = self;
        self.jacketFirstButtonTextField.delegate = self;
        self.flapWidthTextField.delegate = self;
        self.depthOfPleatTextField.delegate = self
        self.vestFirstButtonTextField.delegate = self;
        self.jacketFabricTextField.delegate = self;
        self.pantFabricTextField.delegate = self;
        self.vestFirstButtonTextField.delegate = self;
        self.overallNotesTextField.delegate = self;
        
        self.overallNotesTextField.layer.borderColor = UIColor.blackColor().CGColor;
        self.overallNotesTextField.layer.borderWidth = 1;
        
        //jacket setup
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
        
        //pants setup
        self.pleatCollectionView.registerNib(orderItemCellNib, forCellWithReuseIdentifier: "orderOptionCellId")
        self.pleatCollectionView.dataSource = self;
        self.pleatCollectionView.delegate = self;
        
        //vest
        self.vestCollectionView.registerNib(orderItemCellNib, forCellWithReuseIdentifier: "orderOptionCellId");
        self.vestCollectionView.delegate = self;
        self.vestCollectionView.dataSource = self;
        
        if (existingSuit != nil) {
            self.setupControlsWithEditableSuitInfo()
        }
        else {
            self.setupControlsForNewSuit()
        }
        
    }
    
    func setupControlsWithEditableSuitInfo() {
        //jacket
        self.jacketFabricTextField.text = self.existingSuit?.jacketOrderInfo.fabric;
        self.jacketFabricTextField.hidden = false;
        self.jacketFirstButtonTextField.text = self.existingSuit?.jacketOrderInfo.firstButtonPosition;
        self.ticketPocketSwitch.on = (self.existingSuit?.jacketOrderInfo.ticketPocket)!;
        self.flapWidthTextField.text = self.existingSuit?.jacketOrderInfo.flapWidth;
        self.buttonHoleLapelSwitch.on = (self.existingSuit?.jacketOrderInfo.buttonHoleOnLapel)!;
        if let lapelIndex = self.lapelOptions.indexOf(self.existingSuit!.jacketOrderInfo.lapel) {
            self.lapelCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: lapelIndex, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        }
        self.lapelWidthTextField.text = self.existingSuit?.jacketOrderInfo.lapelWidth;
        if let liningIndex = self.jacketLiningOptions.indexOf(self.existingSuit!.jacketOrderInfo.lining) {
            self.liningCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: liningIndex, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        }
        if let paddingIndex = self.paddingOptions.indexOf(self.existingSuit!.jacketOrderInfo.padding) {
            self.paddingSegmentedControl.selectedSegmentIndex = paddingIndex;
        }
        if let buttonIndex = self.buttonOptions.indexOf(self.existingSuit!.jacketOrderInfo.buttons) {
            self.buttonCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: buttonIndex, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        }
        if let pocketIndex = self.pocketOptions.indexOf(self.existingSuit!.jacketOrderInfo.pockets) {
            self.pocketsCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: pocketIndex, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        }
        if let ventIndex = self.ventOptions.indexOf(self.existingSuit!.jacketOrderInfo.vent) {
            self.ventCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: ventIndex, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        }
        if let stitchIndex = self.stitchOptions.indexOf(self.existingSuit!.jacketOrderInfo.stitch) {
            self.stitchCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: stitchIndex, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        }
        if let cuffIndex = self.cuffsOptions.indexOf(self.existingSuit!.jacketOrderInfo.cuffs) {
            self.cuffsCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: cuffIndex, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        }
        
        //pants
        self.pantFabricTextField.text = self.existingSuit?.pantsOrderInfo.fabric;
        self.pantFabricTextField.hidden = false;
        self.depthOfPleatTextField.text = self.existingSuit?.pantsOrderInfo.depthOfPleat;
        self.extensionSwitch.on = self.existingSuit!.pantsOrderInfo.addExtension;
        
        if let pleatIndex = self.pleatOptions.indexOf(self.existingSuit!.pantsOrderInfo.pleat) {
            self.pleatCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: pleatIndex, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        }
        if let liningIndex = self.pantsLiningOptions.indexOf(self.existingSuit!.pantsOrderInfo.lining) {
            self.liningSegmentedControl.selectedSegmentIndex = liningIndex;
        }
        
        //vest
        if self.existingSuit?.vestOrderInfo != nil {
            self.vestFabricTextField.text = self.existingSuit?.vestOrderInfo!.fabric;
            self.vestFabricTextField.hidden = false;
            self.vestFirstButtonTextField.text = self.existingSuit?.vestOrderInfo!.firstButtonPosition;
            
            if let vestTypeIndex = self.vestOptions.indexOf(self.existingSuit!.vestOrderInfo!.vestType) {
                self.vestCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: vestTypeIndex, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
            }
        }

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        
        self.scrollView.contentSize = CGSizeMake(768, 2520);
        if let suit = existingSuit {
            if suit.vestOrderInfo == nil {
                var scrollViewSize = self.scrollView.contentSize;
                scrollViewSize.height -= self.vestContainerView.frame.size.height;
                self.scrollView.contentSize = scrollViewSize;
                
                var notesFrame = self.NoteAndDoneButtonContainerView.frame;
                notesFrame.origin.y -= self.vestContainerView.frame.size.height;
                self.NoteAndDoneButtonContainerView.frame = notesFrame;
                
                self.vestContainerView.frame = CGRectMake(self.vestContainerView.frame.origin.x, self.vestContainerView.frame.origin.y, 0, 0);
            }
        }
        else if self.fabrics != nil {
            var containsVest = false;
            //strange loop, possibly due to bug in iterating over structs in swift
            if let allFabrics = self.fabrics {
                for fabric in allFabrics {
                    if fabric.vestFabric != nil {
                        containsVest = true;
                    }
                }
            }
            if containsVest == false {
                var scrollViewSize = self.scrollView.contentSize;
                scrollViewSize.height -= self.vestContainerView.frame.size.height;
                self.scrollView.contentSize = scrollViewSize;
                
                var notesFrame = self.NoteAndDoneButtonContainerView.frame;
                notesFrame.origin.y -= self.vestContainerView.frame.size.height;
                self.NoteAndDoneButtonContainerView.frame = notesFrame;
                
                self.vestContainerView.frame = CGRectMake(self.vestContainerView.frame.origin.x, self.vestContainerView.frame.origin.y, 0, 0);
            }
        }
    }
    
    func setupControlsForNewSuit() {
        self.navigationItem.rightBarButtonItem = nil;
        
        //jacket
        self.jacketFabricTextField.hidden = true;
        self.lapelCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        self.liningCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        self.buttonCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        self.pocketsCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        self.ventCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        self.stitchCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        self.cuffsCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        self.navigationItem.rightBarButtonItem = nil;
        
        //pants
        self.pantFabricTextField.hidden = true;
        self.pleatCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        
        //vest
        self.vestFabricTextField.hidden = true;
        self.vestCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
    }
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        self.collectFormDataAndUpdateExistingSuit();
    }
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        if let fabrics = self.fabrics {
            var orders : [SuitOrderInfo] = [];
            
            for fabric in fabrics {
                let suitOrder = SuitOrderInfo();
                //jacket
                let jacketOrder = JacketOrderInfo();
                jacketOrder.fabric = fabric.suitFabric;
                
                var selectedLapelIndexes = self.lapelCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
                jacketOrder.lapel = self.lapelOptions[selectedLapelIndexes[0].row];
                var selectedLiningIndexes = self.liningCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
                jacketOrder.lining = self.jacketLiningOptions[selectedLiningIndexes[0].row];
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
                jacketOrder.firstButtonPosition = self.jacketFirstButtonTextField.text!;
                jacketOrder.ticketPocket = self.ticketPocketSwitch.on;
                jacketOrder.padding = self.paddingOptions[self.paddingSegmentedControl.selectedSegmentIndex];
                jacketOrder.flapWidth = self.flapWidthTextField.text!;
                jacketOrder.buttonHoleOnLapel = self.buttonHoleLapelSwitch.on;
                suitOrder.jacketOrderInfo = jacketOrder;
                
                //pants
                let pantOrder = PantsOrderInfo();
                pantOrder.fabric = fabric.suitFabric;
                var selectedPleatIndexes = self.pleatCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
                pantOrder.pleat = self.pleatOptions[selectedPleatIndexes[0].row];
                pantOrder.addExtension = self.extensionSwitch.on;
                pantOrder.lining = self.pantsLiningOptions[self.liningSegmentedControl.selectedSegmentIndex];
                pantOrder.depthOfPleat = self.depthOfPleatTextField.text!;
                suitOrder.pantsOrderInfo = pantOrder;
                
                //vest
                if (fabric.vestFabric != nil) {
                    let vestOrder = VestOrderInfo();
                    vestOrder.fabric = fabric.suitFabric;
                    
                    let selectedVestTypeIndexes = self.vestCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
                    vestOrder.vestType = self.vestOptions[selectedVestTypeIndexes.first!.row];
                    vestOrder.firstButtonPosition = self.vestFirstButtonTextField.text!;
                    suitOrder.vestOrderInfo = vestOrder;
                }
                
                suitOrder.notes = self.overallNotesTextField.text;
                //append suit order
                orders.append(suitOrder);
            }
            
            //present new suit measurements vc and set delegate
            let suitMeasureVC = UIStoryboard(name: "SuitOrder", bundle: nil).instantiateViewControllerWithIdentifier("suitMeasurementVC") as! SuitMeasurementsViewController;
            suitMeasureVC.suitOrders = orders;
            suitMeasureVC.delegate = self.delegate;
            self.navigationController?.pushViewController(suitMeasureVC, animated: true);
        }
        else if let suit = self.existingSuit {
            self.collectFormDataAndUpdateExistingSuit();
            let suitMeasureVC = UIStoryboard(name: "SuitOrder", bundle: nil).instantiateViewControllerWithIdentifier("suitMeasurementVC") as! SuitMeasurementsViewController;
            suitMeasureVC.existingSuit = suit;
            suitMeasureVC.delegate = self.delegate
            self.navigationController?.pushViewController(suitMeasureVC, animated: true);
            //present existing suit measurements vc and set delegate
        }

    }
    
    func collectFormDataAndUpdateExistingSuit() {
        if let suit = self.existingSuit {
            //jacket
            suit.jacketOrderInfo.fabric = self.jacketFabricTextField.text!;
            
            var selectedLapelIndexes = self.lapelCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
            suit.jacketOrderInfo.lapel = self.lapelOptions[selectedLapelIndexes[0].row];
            var selectedLiningIndexes = self.liningCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
            suit.jacketOrderInfo.lining = self.jacketLiningOptions[selectedLiningIndexes[0].row];
            var selectedButtonIndexes = self.buttonCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
            suit.jacketOrderInfo.buttons = self.buttonOptions[selectedButtonIndexes[0].row];
            var selectedPocketIndexes = self.pocketsCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
            suit.jacketOrderInfo.pockets = self.pocketOptions[selectedPocketIndexes[0].row];
            var selectedVentIndexes = self.ventCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
            suit.jacketOrderInfo.vent = self.ventOptions[selectedVentIndexes[0].row];
            var selectedStitchIndexes = self.stitchCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
            suit.jacketOrderInfo.stitch = self.stitchOptions[selectedStitchIndexes[0].row];
            var selectedCuffIndexes = self.cuffsCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
            suit.jacketOrderInfo.cuffs = self.cuffsOptions[selectedCuffIndexes[0].row];
            
            suit.jacketOrderInfo.lapelWidth = self.lapelWidthTextField.text!;
            suit.jacketOrderInfo.firstButtonPosition = self.jacketFirstButtonTextField.text!;
            suit.jacketOrderInfo.ticketPocket = self.ticketPocketSwitch.on;
            suit.jacketOrderInfo.padding = self.paddingOptions[self.paddingSegmentedControl.selectedSegmentIndex];
            suit.jacketOrderInfo.flapWidth = self.flapWidthTextField.text!;
            suit.jacketOrderInfo.buttonHoleOnLapel = self.buttonHoleLapelSwitch.on;
            
            //pants
            suit.pantsOrderInfo.fabric = self.pantFabricTextField.text!;
            var selectedPleatIndexes = self.pleatCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
            suit.pantsOrderInfo.pleat = self.pleatOptions[selectedPleatIndexes[0].row];
            suit.pantsOrderInfo.addExtension = self.extensionSwitch.on;
            suit.pantsOrderInfo.lining = self.pantsLiningOptions[self.liningSegmentedControl.selectedSegmentIndex];
            suit.pantsOrderInfo.depthOfPleat = self.depthOfPleatTextField.text!;
            
            //vest
            if let existingVest = suit.vestOrderInfo {
                existingVest.fabric = self.vestFabricTextField.text!;
                var selectedVestTypeIndexes = self.vestCollectionView.indexPathsForSelectedItems() as [NSIndexPath]!;
                existingVest.vestType = self.vestOptions[selectedVestTypeIndexes[0].row];
                existingVest.firstButtonPosition = self.vestFirstButtonTextField.text!;
            }
            
            suit.notes = self.overallNotesTextField.text;
        }
    }
    
    //MARK: CollectionView
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        //jacket
        let orderOptionCell = collectionView.dequeueReusableCellWithReuseIdentifier("orderOptionCellId", forIndexPath: indexPath) as! OrderOptionCell;
        
        switch collectionView {
        case self.lapelCollectionView:
            orderOptionCell.configureCellWithOption(self.lapelOptions[indexPath.row]);
        case self.liningCollectionView:
            orderOptionCell.configureCellWithOption(self.jacketLiningOptions[indexPath.row]);
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
        case self.pleatCollectionView:
            orderOptionCell.configureCellWithOption(pleatOptions[indexPath.row]);
        case self.vestCollectionView:
            orderOptionCell.configureCellWithOption(vestOptions[indexPath.row]);
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
            return self.jacketLiningOptions.count
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
        case self.pleatCollectionView:
            return self.pleatOptions.count
        case self.vestCollectionView:
            return self.vestOptions.count
        default:
            return 0;
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(135, 135);
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }

    
}
