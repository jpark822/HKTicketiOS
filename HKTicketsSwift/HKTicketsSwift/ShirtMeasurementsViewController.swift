//
//  ShirtMeasurementsViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 5/12/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit
import MessageUI

class ShirtMeasurementsViewController: UIViewController {
    
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
    
    var delegate : OrderFormDelegate?
    
    //this will not be nil if we are editing
    var editShirtInfo : ShirtOrderInfo?;
    
    //this will not be nil if we are creating new shirts
    var shirts : [ShirtOrderInfo]?
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        if let newShirts = self.shirts {
            let bodyMeasurements : BodyMeasurements = self.delegate!.getBodyMeasurements();
            let shirtFinish : ShirtFinishMeasurements = self.delegate!.getShirtFinishMeasurements();
            prepopulateTextFields(bodyMeasurements, finishMeasurements: shirtFinish);
        }
        else if let existingShirt = self.editShirtInfo, let bodyMeasurements = self.editShirtInfo?.bodyMeasurements, let finishMeasurements = self.editShirtInfo?.finishMeasurements {
            prepopulateTextFields(bodyMeasurements, finishMeasurements: finishMeasurements);
        }
    }
    
    func prepopulateTextFields(bodyMeasurements : BodyMeasurements, finishMeasurements : ShirtFinishMeasurements) {
        self.bodyChest.text = bodyMeasurements.chest;
        self.bodyWaist.text = bodyMeasurements.waist;
        self.bodyHips.text = bodyMeasurements.hips;
        self.bodyShoulders.text = bodyMeasurements.shoulders;
        self.bodySleeveLength.text = bodyMeasurements.sleeveLength;
        self.bodyShirtLength.text = bodyMeasurements.shirtLength;
        self.bodyWristLength.text = bodyMeasurements.wrist;
        self.bodyNeckSize.text = bodyMeasurements.neckSize;
    
        self.finishChest.text = finishMeasurements.chest;
        self.finishWaist.text = finishMeasurements.waist;
        self.finishHips.text = finishMeasurements.hips;
        self.finishShoulders.text = finishMeasurements.shoulders;
        self.finishSleeveLength.text = finishMeasurements.sleeveLength;
        self.finishShirtLength.text = finishMeasurements.shirtLength;
        self.finishCuff.text = finishMeasurements.cuff;
        self.finishNeckSize.text = finishMeasurements.neckSize;
        self.finishSleeve6Below.text = finishMeasurements.sleeveWidth6Below;
        self.finishSleeve12Below.text = finishMeasurements.sleeveWidth12Below;
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
        body.sleeveLength = self.bodySleeveLength.text!;
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
}
