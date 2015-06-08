//
//  ShirtOrderFormViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 5/7/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit
import MessageUI

class ShirtOrderFormViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //needs to be passed along to measurements
    var delegate : OrderFormDelegate?;
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var collarCollectionView: UICollectionView!
    @IBOutlet weak var frontLengthTextField: UITextField!
    @IBOutlet weak var backLengthTextField: UITextField!
    @IBOutlet weak var StavsSegmentedControl: UISegmentedControl!

    @IBOutlet weak var shortSleeveCollectionView: UICollectionView!
    @IBOutlet weak var pocketCollectionView: UICollectionView!
    
    @IBOutlet weak var cuffsCollectionView: UICollectionView!
    @IBOutlet weak var buttonPlacketSwitch: UISwitch!
    
    @IBOutlet weak var convertibleSwitch: UISwitch!
    @IBOutlet weak var shirtFrontCollectionView: UICollectionView!
    

    @IBOutlet weak var shirtBackCollectionView: UICollectionView!
    
    @IBOutlet weak var monogramTextField: UITextField!
    @IBOutlet weak var monogramColorTextField: UITextField!
    @IBOutlet weak var notesTextField: UITextView!
    
    var fabrics : [String]?;
    var collarOptions : [ShirtOrderInfo.Collar]! = [];
    var stavOptions : [ShirtOrderInfo.Stavs]! = [];
    var shortSleeveOptions : [ShirtOrderInfo.ShortSleeve]! = [];
    var pocketOptions : [ShirtOrderInfo.Pockets]! = [];
    var cuffOptions : [ShirtOrderInfo.Cuffs]! = [];
    var shirtFrontOptions : [ShirtOrderInfo.ShirtFront]! = [];
    var shirtBackOptions : [ShirtOrderInfo.ShirtBack]! = [];
    
    //If editing, this will not be nil
    var editShirtinfo : ShirtOrderInfo?;
    @IBOutlet weak var fabricTextBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.notesTextField.layer.borderColor = UIColor.blackColor().CGColor;
        self.notesTextField.layer.borderWidth = 1;
        self.scrollView.contentSize = CGSizeMake(768, 2700);
        
        self.collarCollectionView.delegate = self;
        self.collarCollectionView.dataSource = self;
        self.shortSleeveCollectionView.delegate = self;
        self.shortSleeveCollectionView.dataSource = self;
        self.pocketCollectionView.delegate = self;
        self.pocketCollectionView.dataSource = self;
        self.cuffsCollectionView.delegate = self;
        self.cuffsCollectionView.dataSource = self;
        self.shirtFrontCollectionView.delegate = self;
        self.shirtFrontCollectionView.dataSource = self;
        self.shirtBackCollectionView.delegate = self;
        self.shirtBackCollectionView.dataSource = self;
        
        let orderItemCellNib = UINib(nibName: "OrderItemCell", bundle: nil);
        self.collarCollectionView.registerNib(orderItemCellNib, forCellWithReuseIdentifier: "orderItemCellId");
        self.shortSleeveCollectionView.registerNib(orderItemCellNib, forCellWithReuseIdentifier: "orderItemCellId");
        self.pocketCollectionView.registerNib(orderItemCellNib, forCellWithReuseIdentifier: "orderItemCellId");
        self.cuffsCollectionView.registerNib(orderItemCellNib, forCellWithReuseIdentifier: "orderItemCellId");
        self.shirtFrontCollectionView.registerNib(orderItemCellNib, forCellWithReuseIdentifier: "orderItemCellId");
        self.shirtBackCollectionView.registerNib(orderItemCellNib, forCellWithReuseIdentifier: "orderItemCellId");
        
        self.frontLengthTextField.delegate = self;
        self.backLengthTextField.delegate = self;
        self.monogramColorTextField.delegate = self;
        self.monogramTextField.delegate = self;
        self.notesTextField.delegate = self;
        self.notesTextField.layer.borderColor = UIColor.blackColor().CGColor;
        self.notesTextField.layer.borderWidth = 1;
        
        self.collarOptions = [ShirtOrderInfo.Collar.ClosePoint,
        ShirtOrderInfo.Collar.MediumSpread,
        ShirtOrderInfo.Collar.WideSpread,
        ShirtOrderInfo.Collar.ButtonDown,
        ShirtOrderInfo.Collar.HiddenButtonDown,
        ShirtOrderInfo.Collar.Tab,
        ShirtOrderInfo.Collar.EyeLets,
        ShirtOrderInfo.Collar.Other];
        
        self.stavOptions = [ShirtOrderInfo.Stavs.Detachable,
            ShirtOrderInfo.Stavs.Permenant];
        
        self.shortSleeveOptions = [ShirtOrderInfo.ShortSleeve.S1,
        ShirtOrderInfo.ShortSleeve.S2,
        ShirtOrderInfo.ShortSleeve.S4,
        ShirtOrderInfo.ShortSleeve.S5,
        ShirtOrderInfo.ShortSleeve.None];
        
        self.pocketOptions = [ShirtOrderInfo.Pockets.P2,
        ShirtOrderInfo.Pockets.P3,
        ShirtOrderInfo.Pockets.P6,
        ShirtOrderInfo.Pockets.P10,
        ShirtOrderInfo.Pockets.NoPockets];
        
        self.cuffOptions = [ShirtOrderInfo.Cuffs.C1,
        ShirtOrderInfo.Cuffs.C2,
        ShirtOrderInfo.Cuffs.C3,
        ShirtOrderInfo.Cuffs.C4,
        ShirtOrderInfo.Cuffs.C5,
        ShirtOrderInfo.Cuffs.C6,
        ShirtOrderInfo.Cuffs.C9,
        ShirtOrderInfo.Cuffs.C10,
        ShirtOrderInfo.Cuffs.Other];
        
        self.shirtFrontOptions = [ShirtOrderInfo.ShirtFront.Placket,
        ShirtOrderInfo.ShirtFront.Plain,
            ShirtOrderInfo.ShirtFront.HiddenButton];
        
        self.shirtBackOptions = [ShirtOrderInfo.ShirtBack.Plain,
        ShirtOrderInfo.ShirtBack.PlainWithDart,
        ShirtOrderInfo.ShirtBack.BoxPleat,
            ShirtOrderInfo.ShirtBack.SinglePleat];
        
        if let existingShirtOrder = self.editShirtinfo {
            self.setupControlsWithEditableShirtOrderInfo();
        }
        else {
            self.collarCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
            self.shortSleeveCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
            self.pocketCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
            self.cuffsCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
            self.shirtFrontCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
            self.shirtBackCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
            
            self.navigationItem.rightBarButtonItem = nil;
        }
    }
    
    func setupControlsWithEditableShirtOrderInfo() {
        self.fabricTextBox.hidden = false;
        self.fabricTextBox.text = self.editShirtinfo!.fabric;
        if let collarIndex = find(self.collarOptions, self.editShirtinfo!.collar) {
            self.collarCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: collarIndex, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        }
        if let stavIndex = find(self.stavOptions, self.editShirtinfo!.stavs) {
            self.StavsSegmentedControl.selectedSegmentIndex = stavIndex;
        }
        if let shortSleeveIndex = find(self.shortSleeveOptions, self.editShirtinfo!.shortSleeves) {
            self.shortSleeveCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: shortSleeveIndex, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        }
        if let pocketIndex = find(self.pocketOptions, self.editShirtinfo!.pockets) {
            self.pocketCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: pocketIndex, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        }
        if let cuffIndex = find(self.cuffOptions, self.editShirtinfo!.cuffs) {
            self.cuffsCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: cuffIndex, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        }
        if let shirtFrontIndex = find(self.shirtFrontOptions, self.editShirtinfo!.shirtFront) {
            self.shirtFrontCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: shirtFrontIndex, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        }
        if let shirtBackIndex = find(self.shirtBackOptions, self.editShirtinfo!.shirtBack) {
            self.shirtBackCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: shirtBackIndex, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        }
        self.frontLengthTextField.text = self.editShirtinfo!.frontCollarLength;
        self.backLengthTextField.text = self.editShirtinfo!.backCollarLength;
        self.buttonPlacketSwitch.on = self.editShirtinfo!.buttonOnPlacket;
        self.convertibleSwitch.on = self.editShirtinfo!.convertibleCuff;
        self.monogramTextField.text = self.editShirtinfo!.monogram;
        self.monogramColorTextField.text = self.editShirtinfo!.monogramColor;
        self.notesTextField.text = self.editShirtinfo!.notes;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if (textField == self.monogramTextField ||
            textField == self.monogramColorTextField) {
                keyboardWillShow();
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if (textField == self.monogramTextField ||
            textField == self.monogramColorTextField) {
                keyboardWillHide();
        }
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        keyboardWillShow()
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        keyboardWillHide();
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
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

    @IBAction func backButtonPressed(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true);
    }
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        if let fabrics = self.fabrics {
            var orders : [ShirtOrderInfo]! = [];
            
            for fabric in fabrics
            {
                var shirtOrder = ShirtOrderInfo();
                var selectedCollarIndexes = self.collarCollectionView.indexPathsForSelectedItems() as! [NSIndexPath];
                shirtOrder.collar = self.collarOptions[selectedCollarIndexes[0].row];
                shirtOrder.stavs = self.stavOptions[self.StavsSegmentedControl.selectedSegmentIndex];
                var selectedSleeveIndexes = self.shortSleeveCollectionView.indexPathsForSelectedItems() as! [NSIndexPath];
                shirtOrder.shortSleeves = self.shortSleeveOptions[selectedSleeveIndexes[0].row];
                var selectedPocketsIndexes = self.pocketCollectionView.indexPathsForSelectedItems() as! [NSIndexPath];
                shirtOrder.pockets = self.pocketOptions[selectedPocketsIndexes[0].row];
                var selectedCuffsIndexes = self.cuffsCollectionView.indexPathsForSelectedItems() as! [NSIndexPath];
                shirtOrder.cuffs = self.cuffOptions[selectedCuffsIndexes[0].row];
                var selectedShirtFrontIndexes = self.shirtFrontCollectionView.indexPathsForSelectedItems() as! [NSIndexPath];
                shirtOrder.shirtFront = self.shirtFrontOptions[selectedShirtFrontIndexes[0].row];
                var selectedShirtBackIndexes = self.shirtBackCollectionView.indexPathsForSelectedItems() as! [NSIndexPath];
                shirtOrder.shirtBack = self.shirtBackOptions[selectedShirtBackIndexes[0].row];
                shirtOrder.frontCollarLength = self.frontLengthTextField.text;
                shirtOrder.backCollarLength = self.backLengthTextField.text;
                shirtOrder.buttonOnPlacket = self.buttonPlacketSwitch.on;
                shirtOrder.convertibleCuff = self.convertibleSwitch.on;
                shirtOrder.monogram = self.monogramTextField.text;
                shirtOrder.monogramColor = self.monogramColorTextField.text;
                shirtOrder.fabric = fabric;
                shirtOrder.notes = self.notesTextField.text;
                
                orders.append(shirtOrder);
            }

            var shirtMeasurementsVC = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("ShirtMeasurementsControllerId") as! ShirtMeasurementsViewController;
            shirtMeasurementsVC.delegate = self.delegate;
            shirtMeasurementsVC.shirts = orders;
            self.navigationController?.pushViewController(shirtMeasurementsVC, animated: true);
        }
            
        else if self.editShirtinfo != nil {
            self.collectFormDataAndUpdateExistingShirt();
            var shirtMeasurementsVC = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("ShirtMeasurementsControllerId") as! ShirtMeasurementsViewController;
            shirtMeasurementsVC.delegate = self.delegate;
            shirtMeasurementsVC.editShirtInfo = self.editShirtinfo;
            self.navigationController?.pushViewController(shirtMeasurementsVC, animated: true);
        }
    }
    
    func collectFormDataAndUpdateExistingShirt() {
        if let shirtToEdit = self.editShirtinfo {
            var selectedCollarIndexes = self.collarCollectionView.indexPathsForSelectedItems() as! [NSIndexPath];
            self.editShirtinfo!.collar = self.collarOptions[selectedCollarIndexes[0].row];
            self.editShirtinfo!.stavs = self.stavOptions[self.StavsSegmentedControl.selectedSegmentIndex];
            var selectedShortSleeveIndexes = self.shortSleeveCollectionView.indexPathsForSelectedItems() as! [NSIndexPath];
            self.editShirtinfo!.shortSleeves = self.shortSleeveOptions[selectedShortSleeveIndexes[0].row];
            var selectedPocketIndexes = self.pocketCollectionView.indexPathsForSelectedItems() as! [NSIndexPath];
            self.editShirtinfo!.pockets = self.pocketOptions[selectedPocketIndexes[0].row];
            var selectedCuffIndexes = self.cuffsCollectionView.indexPathsForSelectedItems() as! [NSIndexPath];
            self.editShirtinfo!.cuffs = self.cuffOptions[selectedCuffIndexes[0].row];
            var selectedShirtFrontIndexes = self.shirtFrontCollectionView.indexPathsForSelectedItems() as! [NSIndexPath];
            self.editShirtinfo!.shirtFront = self.shirtFrontOptions[selectedShirtFrontIndexes[0].row];
            var selectedShirtBackIndexes = self.shirtBackCollectionView.indexPathsForSelectedItems() as! [NSIndexPath];
            self.editShirtinfo!.shirtBack = self.shirtBackOptions[selectedShirtBackIndexes[0].row];
            self.editShirtinfo!.frontCollarLength = self.frontLengthTextField.text;
            self.editShirtinfo!.backCollarLength = self.backLengthTextField.text;
            self.editShirtinfo!.buttonOnPlacket = self.buttonPlacketSwitch.on;
            self.editShirtinfo!.convertibleCuff = self.convertibleSwitch.on;
            self.editShirtinfo!.monogram = self.monogramTextField.text;
            self.editShirtinfo!.monogramColor = self.monogramColorTextField.text;
            self.editShirtinfo!.fabric = self.fabricTextBox.text;
            self.editShirtinfo!.notes = self.notesTextField.text;
        }
    }
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        
        self.collectFormDataAndUpdateExistingShirt();
    }
    
    //MARK: collection view delegate and data source
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var orderOptionCell = collectionView.dequeueReusableCellWithReuseIdentifier("orderItemCellId", forIndexPath: indexPath) as! OrderOptionCell;
        
        switch collectionView {
        case self.collarCollectionView:
            orderOptionCell.configureCellWithOption(self.collarOptions[indexPath.row]);
        case self.shortSleeveCollectionView:
            orderOptionCell.configureCellWithOption(self.shortSleeveOptions[indexPath.row]);
        case self.pocketCollectionView:
            orderOptionCell.configureCellWithOption(self.pocketOptions[indexPath.row]);
        case self.cuffsCollectionView:
            orderOptionCell.configureCellWithOption(self.cuffOptions[indexPath.row]);
        case self.shirtFrontCollectionView:
            orderOptionCell.configureCellWithOption(self.shirtFrontOptions[indexPath.row]);
        case self.shirtBackCollectionView:
            orderOptionCell.configureCellWithOption(self.shirtBackOptions[indexPath.row]);
        default:
            println("no item for option");
        }
        
        return orderOptionCell;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == self.collarCollectionView) {
            return self.collarOptions.count;
        }
        else if (collectionView == self.shortSleeveCollectionView) {
            return self.shortSleeveOptions.count;
        }
        else if (collectionView == self.pocketCollectionView) {
            return self.pocketOptions.count;
        }
        else if (collectionView == self.cuffsCollectionView) {
            return self.cuffOptions.count;
        }
        else if (collectionView == self.shirtFrontCollectionView) {
            return self.shirtFrontOptions.count;
        }
        else if (collectionView == self.shirtBackCollectionView) {
            return self.shirtBackOptions.count;
        }
        return 0;
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(135, 135);
    }

}
