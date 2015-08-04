//
//  ShirtMeasurementsViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 5/12/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit
import MessageUI

class ShirtMeasurementsViewController: UIViewController, UITextFieldDelegate, CustomerMeasurementChooserDelegate {
    
    @IBOutlet weak var bodyChest: UITextField!
    @IBOutlet weak var bodyWaist: UITextField!
    @IBOutlet weak var bodyHips: UITextField!
    @IBOutlet weak var bodyShoulders: UITextField!
    @IBOutlet weak var bodySleeveLength: UITextField!
    @IBOutlet weak var bodyShirtLength: UITextField!
    @IBOutlet weak var bodyWristLength: UITextField!
    @IBOutlet weak var bodyNeckSize: UITextField!
    
    @IBOutlet weak var finishChest: UITextField!
    @IBOutlet weak var finishWaist: UITextField!
    @IBOutlet weak var finishHips: UITextField!
    @IBOutlet weak var finishShoulders: UITextField!
    @IBOutlet weak var finishSleeveLength: UITextField!
    @IBOutlet weak var finishShirtLength: UITextField!
    @IBOutlet weak var finishCuff: UITextField!
    @IBOutlet weak var finishNeckSize: UITextField!
    @IBOutlet weak var finishSleeve6Below: UITextField!
    @IBOutlet weak var finishSleeve12Below: UITextField!
    @IBOutlet weak var addShirtButton: UIButton!
    
    var delegate : OrderFormDelegate?
    
    //this will not be nil if we are editing
    var editShirtInfo : ShirtOrderInfo?;
    
    //this will not be nil if we are creating new shirts
    var shirts : [ShirtOrderInfo]?
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.addShirtButton.layer.cornerRadius = HKTStyling.cornerRadiusMedium;
        
        self.bodyChest.delegate = self;
        self.bodyWaist.delegate = self;
        self.bodyHips.delegate = self;
        self.bodyShoulders.delegate = self;
        self.bodySleeveLength.delegate = self;
        self.bodyShirtLength.delegate = self;
        self.bodyWristLength.delegate = self;
        self.bodyNeckSize.delegate = self;
        self.finishChest.delegate = self;
        self.finishWaist.delegate = self;
        self.finishHips.delegate = self;
        self.finishShoulders.delegate = self;
        self.finishSleeveLength.delegate = self;
        self.finishShirtLength.delegate = self;
        self.finishCuff.delegate = self;
        self.finishNeckSize.delegate = self;
        self.finishSleeve6Below.delegate = self;
        self.finishSleeve12Below.delegate = self;
        
        if self.shirts != nil {
            if let bodyMeasurements : BodyMeasurements = self.delegate!.getBodyMeasurements(),
               let finishMeasurements : FinishMeasurements = self.delegate!.getInitialFinishMeasurements() {
                self.prepopulateTextFields(bodyMeasurements, finishMeasurements: finishMeasurements);
            }

        }
        else if let bodyMeasurements = self.editShirtInfo?.bodyMeasurements, let finishMeasurements = self.editShirtInfo?.finishMeasurements {
            prepopulateTextFields(bodyMeasurements, shirtFinishMeasurements: finishMeasurements);
        }
    }
    
    func prepopulateTextFields(bodyMeasurements : BodyMeasurements, shirtFinishMeasurements : ShirtFinishMeasurements) {
        prepopulateBodyTextFields(bodyMeasurements);
    
        self.finishChest.text = shirtFinishMeasurements.chest;
        self.finishWaist.text = shirtFinishMeasurements.waist;
        self.finishHips.text = shirtFinishMeasurements.hips;
        self.finishShoulders.text = shirtFinishMeasurements.shoulders;
        self.finishSleeveLength.text = shirtFinishMeasurements.sleeveLength;
        self.finishShirtLength.text = shirtFinishMeasurements.shirtLength;
        self.finishCuff.text = shirtFinishMeasurements.cuff;
        self.finishNeckSize.text = shirtFinishMeasurements.neckSize;
        self.finishSleeve6Below.text = shirtFinishMeasurements.sleeveWidth6Below;
        self.finishSleeve12Below.text = shirtFinishMeasurements.sleeveWidth12Below;
    }
    
    func prepopulateTextFields(bodyMeasurements : BodyMeasurements, finishMeasurements : FinishMeasurements) {
        self.prepopulateBodyTextFields(bodyMeasurements);
        self.prepopulateFinishTextFields(finishMeasurements);
    }
    
    func prepopulateBodyTextFields(bodyMeasurements : BodyMeasurements) {
        self.bodyChest.text = bodyMeasurements.chest;
        self.bodyWaist.text = bodyMeasurements.waist;
        self.bodyHips.text = bodyMeasurements.hips;
        self.bodyShoulders.text = bodyMeasurements.shoulders;
        self.bodySleeveLength.text = bodyMeasurements.shirtSleeveLength;
        self.bodyShirtLength.text = bodyMeasurements.shirtLength;
        self.bodyWristLength.text = bodyMeasurements.wrist;
        self.bodyNeckSize.text = bodyMeasurements.neckSize;
    }
    
    func prepopulateFinishTextFields(finishMeasurements : FinishMeasurements) {
        self.finishChest.text = finishMeasurements.chest;
        self.finishWaist.text = finishMeasurements.waist;
        self.finishHips.text = finishMeasurements.hips;
        self.finishShoulders.text = finishMeasurements.shoulders;
        self.finishSleeveLength.text = finishMeasurements.shirtSleeveLength;
        self.finishShirtLength.text = finishMeasurements.shirtLength;
        self.finishCuff.text = finishMeasurements.shirtCuff;
        self.finishNeckSize.text = finishMeasurements.shirtNeck;
        self.finishSleeve6Below.text = finishMeasurements.shirtWidth6Below;
        self.finishSleeve12Below.text = finishMeasurements.shirtWidth12Below;
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true);
    }
    @IBAction func doneButtonPressed(sender: AnyObject) {
        let body : BodyMeasurements = BodyMeasurements();
        body.chest = self.bodyChest.text!;
        body.waist = self.bodyWaist.text!;
        body.hips = self.bodyHips.text!;
        body.shoulders = self.bodyShoulders.text!;
        body.shirtSleeveLength = self.bodySleeveLength.text!;
        body.shirtLength = self.bodyShirtLength.text!;
        body.wrist = self.bodyWristLength.text!;
        body.neckSize = self.bodyNeckSize.text!;
        
        let finish : ShirtFinishMeasurements = ShirtFinishMeasurements();
        finish.chest = self.finishChest.text!;
        finish.waist = self.finishWaist.text!;
        finish.hips = self.finishHips.text!;
        finish.shoulders = self.finishShoulders.text!;
        finish.sleeveLength = self.finishSleeveLength.text!;
        finish.shirtLength = self.finishShirtLength.text!;
        finish.cuff = self.finishCuff.text!;
        finish.neckSize = self.finishNeckSize.text!;
        finish.sleeveWidth6Below = self.finishSleeve6Below.text!;
        finish.sleeveWidth12Below =  self.finishSleeve12Below.text!;
        
        if let shirtInfos = self.shirts {
            for shirt in shirtInfos {
                shirt.bodyMeasurements = body;
                shirt.finishMeasurements = finish;
            }
            self.delegate?.didFinishCustomizingShirts(shirtInfos);
            self.navigationController?.popToRootViewControllerAnimated(true);
        }
        else if let existingShirt = self.editShirtInfo {
            existingShirt.bodyMeasurements = body;
            existingShirt.finishMeasurements = finish;
            self.delegate?.didFinishEditingShirt(existingShirt);
            self.navigationController?.popToRootViewControllerAnimated(true);
        }
    }
    
    @IBAction func addFinishMeasurementsPressed(sender: AnyObject) {
        let measurementChooserVC = UIStoryboard(name: "Customer", bundle: nil).instantiateViewControllerWithIdentifier("customerMeasurementChooserModalId") as! CustomerMeasurementChooserModalViewController;
        measurementChooserVC.modalPresentationStyle = UIModalPresentationStyle.FormSheet;
        measurementChooserVC.preferredContentSize = CGSizeMake(450, 350);
        measurementChooserVC.delegate = self;
        measurementChooserVC.finishMeasurements = self.delegate!.getFinishMeasurements();
        self.presentViewController(measurementChooserVC, animated: true, completion: nil);
    }
    
    func CustomerMeasurementChooserDidSelectIndex(index: NSInteger) {
        let finish = self.delegate!.getFinishMeasurements()[index];
        self.prepopulateFinishTextFields(finish);
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
}
