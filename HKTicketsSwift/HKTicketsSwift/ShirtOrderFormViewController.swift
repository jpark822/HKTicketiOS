//
//  ShirtOrderFormViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 5/7/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit
import MessageUI

class ShirtOrderFormViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    //needs to be passed along to measurements
    var delegate : OrderFormDelegate?;
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var newOrderNumberTextField: UITextField!
    @IBOutlet weak var oldOrderNumberTextField: UITextField!
    @IBOutlet weak var collarSegmentedControl: UISegmentedControl!
    @IBOutlet weak var frontLengthTextField: UITextField!
    @IBOutlet weak var backLengthTextField: UITextField!
    @IBOutlet weak var StavsSegmentedControl: UISegmentedControl!
    @IBOutlet weak var ShortSleeveSegmentedControl: UISegmentedControl!
    @IBOutlet weak var pocketsSegmentedControl: UISegmentedControl!
    @IBOutlet weak var cuffsSegmentedControl: UISegmentedControl!
    @IBOutlet weak var buttonPlacketSwitch: UISwitch!
    
    @IBOutlet weak var convertibleSwitch: UISwitch!
    @IBOutlet weak var shirtFrontSegmentedControl: UISegmentedControl!
    @IBOutlet weak var shirtBackSegmentedControl: UISegmentedControl!
    @IBOutlet weak var monogramTextField: UITextField!
    @IBOutlet weak var monogramColorTextField: UITextField!
    @IBOutlet weak var notesTextField: UITextView!
    
    var fabrics : [String]! = [];
    var collarOptions : [ShirtOrderInfo.Collar]! = [];
    var stavOptions : [ShirtOrderInfo.Stavs]! = [];
    var shortSleeveOptions : [ShirtOrderInfo.ShortSleeve]! = [];
    var pocketOptions : [ShirtOrderInfo.Pockets]! = [];
    var cuffOptions : [ShirtOrderInfo.Cuffs]! = [];
    var shirtFrontOptions : [ShirtOrderInfo.ShirtFront]! = [];
    var shirtBackOptions : [ShirtOrderInfo.ShirtBack]! = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.newOrderNumberTextField.delegate = self;
        self.oldOrderNumberTextField.delegate = self;
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
            ShirtOrderInfo.Collar.EyeLets];
        
        self.stavOptions = [ShirtOrderInfo.Stavs.Detachable,
            ShirtOrderInfo.Stavs.Permenant];
        
        self.shortSleeveOptions = [ShirtOrderInfo.ShortSleeve.S1,
        ShirtOrderInfo.ShortSleeve.S2,
        ShirtOrderInfo.ShortSleeve.S4,
            ShirtOrderInfo.ShortSleeve.S5];
        
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
            ShirtOrderInfo.Cuffs.C10];
        
        self.shirtFrontOptions = [ShirtOrderInfo.ShirtFront.Placket,
        ShirtOrderInfo.ShirtFront.Plain,
            ShirtOrderInfo.ShirtFront.HiddenButton];
        
        self.shirtBackOptions = [ShirtOrderInfo.ShirtBack.Plain,
        ShirtOrderInfo.ShirtBack.PlainWithDart,
        ShirtOrderInfo.ShirtBack.BoxPleat,
            ShirtOrderInfo.ShirtBack.SinglePleat];
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
        var orders : [ShirtOrderInfo]! = [];
        
        for fabric in self.fabrics
        {
            var shirtOrder = ShirtOrderInfo();
            shirtOrder.collar = self.collarOptions[self.collarSegmentedControl.selectedSegmentIndex];
            shirtOrder.stavs = self.stavOptions[self.StavsSegmentedControl.selectedSegmentIndex];
            shirtOrder.shortSleeves = self.shortSleeveOptions[self.ShortSleeveSegmentedControl.selectedSegmentIndex];
            shirtOrder.pockets = self.pocketOptions[self.pocketsSegmentedControl.selectedSegmentIndex];
            shirtOrder.cuffs = self.cuffOptions[self.cuffsSegmentedControl.selectedSegmentIndex];
            shirtOrder.shirtFront = self.shirtFrontOptions[self.shirtFrontSegmentedControl.selectedSegmentIndex];
            shirtOrder.shirtBack = self.shirtBackOptions[self.shirtBackSegmentedControl.selectedSegmentIndex];
            shirtOrder.frontCollarLength = self.frontLengthTextField.text;
            shirtOrder.backCollarLength = self.backLengthTextField.text;
            shirtOrder.buttonOnPlacket = self.buttonPlacketSwitch.on;
            shirtOrder.convertibleCuff = self.convertibleSwitch.on;
            shirtOrder.monogram = self.monogramTextField.text;
            shirtOrder.monogramColor = self.monogramColorTextField.text;
            shirtOrder.fabric = fabric;
            shirtOrder.oldOrderNumber = self.oldOrderNumberTextField.text;
            shirtOrder.newOrderNumber = self.newOrderNumberTextField.text;
            shirtOrder.notes = self.notesTextField.text;
            
            orders.append(shirtOrder);
        }
        self.delegate?.didFinishCustomizingShirts(orders);
        self.dismissViewControllerAnimated(true, completion: nil);
    }

}
