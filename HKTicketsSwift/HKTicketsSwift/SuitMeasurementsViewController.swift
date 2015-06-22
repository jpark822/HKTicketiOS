//
//  SuitMeasurementsViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 6/10/15.
//  Copyright © 2015 JPApps. All rights reserved.
//

import UIKit

class SuitMeasurementsViewController: UIViewController, UITextFieldDelegate {
    //jacket outlets
    @IBOutlet weak var jacketBodyChest: UITextField!
    @IBOutlet weak var jacketBodyWaist: UITextField!
    @IBOutlet weak var jacketBodyHips: UITextField!
    @IBOutlet weak var jacketBodyShoulders: UITextField!
    @IBOutlet weak var jacketBodySleeveLength: UITextField!
    @IBOutlet weak var jacketBodyJacketWidth: UITextField!
    @IBOutlet weak var jacketBodyJacketLength: UITextField!
    @IBOutlet weak var jacketBodyBicep: UITextField!
    @IBOutlet weak var jacketBodyArmHole: UITextField!
    @IBOutlet weak var jacketBodyBelly: UITextField!
    
    @IBOutlet weak var jacketFinishChest: UITextField!
    @IBOutlet weak var jacketFinishWaist: UITextField!
    @IBOutlet weak var jacketFinishHips: UITextField!
    @IBOutlet weak var jacketFinishShoulders: UITextField!
    @IBOutlet weak var jacketFinishSleeveLength: UITextField!
    @IBOutlet weak var jacketFinishHalfShoulder: UITextField!
    @IBOutlet weak var jacketFinishJacketLength: UITextField!
    @IBOutlet weak var jacketFinishJacketSleeve: UITextField!
    
    //pants outlets
    @IBOutlet weak var pantsBodyWaist: UITextField!
    @IBOutlet weak var pantsBodySeat: UITextField!
    @IBOutlet weak var pantsBodyCrotch: UITextField!
    @IBOutlet weak var pantsBodyActualThigh: UITextField!
    @IBOutlet weak var pantsBodyOutseam: UITextField!
    @IBOutlet weak var pantsBodyInseam: UITextField!
    
    @IBOutlet weak var pantsFinishWaist: UITextField!
    @IBOutlet weak var pantsFinishSeat: UITextField!
    @IBOutlet weak var pantsFinishCrotch: UITextField!
    @IBOutlet weak var pantsFinish1623below: UITextField!
    @IBOutlet weak var pantsFinishBottomCuff: UITextField!
    @IBOutlet weak var pantsFinishOutseam: UITextField!
    @IBOutlet weak var pantsFinishInseam: UITextField!
    
    //vest outlets
    @IBOutlet weak var vestBodyChest: UITextField!
    @IBOutlet weak var vestBodyWaist: UITextField!
    @IBOutlet weak var vestBodyHips: UITextField!
    @IBOutlet weak var vestBodyShoulders: UITextField!
    
    @IBOutlet weak var vestFinishFrontLength: UITextField!
    @IBOutlet weak var vestFinishBackLength: UITextField!
    
    var suitOrders : [SuitOrderInfo]?;
    var existingSuit : SuitOrderInfo?;
    var delegate : OrderFormDelegate?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (self.existingSuit != nil) {
            self.prepopulateTextFields();
        }
        
        self.vestBodyChest.delegate = self;
        self.vestBodyWaist.delegate = self;
        self.vestBodyHips.delegate = self;
        self.vestBodyShoulders.delegate = self;
        self.vestFinishBackLength.delegate = self;
        self.vestFinishFrontLength.delegate = self;
    }    
    
    func keyboardWillHide() {
        var frame = self.view.frame;
        frame.origin.y += 264;
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.view.frame = frame;
            }, completion: nil)
    }
    
    func prepopulateTextFields() {
        //jacket
        let jacketBody = self.existingSuit?.jacketOrderInfo.bodyMeasurements;
        self.jacketBodyChest.text = jacketBody?.chest;
        self.jacketBodyWaist.text = jacketBody?.waist;
        self.jacketBodyHips.text = jacketBody?.hips;
        self.jacketBodyShoulders.text = jacketBody?.shoulders;
        self.jacketBodySleeveLength.text = jacketBody?.sleeveLength;
        self.jacketBodyJacketWidth.text = jacketBody?.jacketWidth;
        self.jacketBodyJacketLength.text = jacketBody?.jacketLength;
        self.jacketBodyBicep.text = jacketBody?.bicep;
        self.jacketBodyArmHole.text = jacketBody?.armHole;
        self.jacketBodyBelly.text = jacketBody?.belly;
        
        let jacketFinish = self.existingSuit?.jacketOrderInfo.finishMeasurements;
        self.jacketFinishChest.text = jacketFinish?.chest;
        self.jacketFinishWaist.text = jacketFinish?.waist;
        self.jacketFinishHips.text = jacketFinish?.hips;
        self.jacketFinishShoulders.text = jacketFinish?.shoulders;
        self.jacketFinishSleeveLength.text = jacketFinish?.sleeveLength;
        self.jacketFinishHalfShoulder.text = jacketFinish?.halfShoulder;
        self.jacketFinishJacketLength.text = jacketFinish?.jacketLength;
        self.jacketFinishJacketSleeve.text = jacketFinish?.jacketSleeve;
        
        //pants
        let pantBody = self.existingSuit?.pantsOrderInfo.bodyMeasurements;
        self.pantsBodyWaist.text = pantBody!.waist;
        self.pantsBodySeat.text = pantBody!.seat;
        self.pantsBodyCrotch.text = pantBody!.crotch;
        self.pantsBodyActualThigh.text = pantBody!.actualThigh;
        self.pantsBodyOutseam.text = pantBody!.outseam;
        self.pantsBodyInseam.text = pantBody!.inseam
        
        let pantsFinish = self.existingSuit?.pantsOrderInfo.finishMeasurements;
        self.pantsFinishWaist.text = pantsFinish!.waist;
        self.pantsFinishSeat.text = pantsFinish!.seat;
        self.pantsFinishCrotch.text = pantsFinish!.crotch;
        self.pantsFinish1623below.text = pantsFinish!.below1623;
        self.pantsFinishBottomCuff.text = pantsFinish!.bottomCuff;
        self.pantsFinishOutseam.text = pantsFinish!.outseam;
        self.pantsFinishInseam.text = pantsFinish!.inseam;
        
        //vest
        if let vestBody = self.existingSuit?.vestOrderInfo!.bodyMeasurements {
            self.vestBodyChest.text = vestBody.chest;
            self.vestBodyWaist.text = vestBody.waist;
            self.vestBodyHips.text = vestBody.hips;
            self.vestBodyShoulders.text = vestBody.shoulders;
        }
        else {
            self.vestBodyChest.hidden = true;
            self.vestBodyWaist.hidden = true;
            self.vestBodyHips.hidden = true;
            self.vestBodyShoulders.hidden = true;
        }
        
        if let vestFinish = self.existingSuit?.vestOrderInfo!.finishMeasurements {
            self.vestFinishFrontLength.text = vestFinish.frontLength;
            self.vestFinishBackLength.text = vestFinish.backLength;
        }
        else {
            self.vestFinishFrontLength.hidden = true;
            self.vestFinishBackLength.hidden = true;
        }
    }
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        //jacket
        let jacketBody : BodyMeasurements = BodyMeasurements();
        jacketBody.chest = self.jacketBodyChest.text!;
        jacketBody.waist = self.jacketBodyWaist.text!;
        jacketBody.hips = self.jacketBodyHips.text!;
        jacketBody.shoulders = self.jacketBodyShoulders.text!;
        jacketBody.sleeveLength = self.jacketBodySleeveLength.text!;
        jacketBody.jacketWidth = self.jacketBodyJacketWidth.text!;
        jacketBody.jacketLength = self.jacketBodyJacketLength.text!;
        jacketBody.bicep = self.jacketBodyBicep.text!;
        jacketBody.armHole = self.jacketBodyArmHole.text!;
        jacketBody.belly = self.jacketBodyBelly.text!
        ;
        
        let jacketFinish : JacketFinishMeasurements = JacketFinishMeasurements();
        jacketFinish.chest = self.jacketFinishChest.text!;
        jacketFinish.waist = self.jacketFinishWaist.text!;
        jacketFinish.hips = self.jacketFinishHips.text!;
        jacketFinish.shoulders = self.jacketFinishShoulders.text!;
        jacketFinish.sleeveLength = self.jacketFinishSleeveLength.text!;
        jacketFinish.halfShoulder = self.jacketFinishHalfShoulder.text!;
        jacketFinish.jacketLength = self.jacketFinishJacketLength.text!;
        jacketFinish.jacketSleeve = self.jacketFinishJacketSleeve.text!;
        
        //pants
        let pantsBody : BodyMeasurements = BodyMeasurements();
        pantsBody.waist = self.pantsBodyWaist.text!;
        pantsBody.seat = self.pantsBodySeat.text!;
        pantsBody.crotch = self.pantsBodyCrotch.text!;
        pantsBody.actualThigh = self.pantsBodyActualThigh.text!;
        pantsBody.outseam = self.pantsBodyOutseam.text!;
        pantsBody.inseam = self.pantsBodyInseam.text!;
        
        let pantsFinish : PantsFinishMeasurements = PantsFinishMeasurements();
        pantsFinish.waist = self.pantsFinishWaist.text!;
        pantsFinish.seat = self.pantsFinishSeat.text!;
        pantsFinish.crotch = self.pantsFinishCrotch.text!;
        pantsFinish.below1623 = self.pantsFinish1623below.text!;
        pantsFinish.bottomCuff = self.pantsFinishBottomCuff.text!;
        pantsFinish.outseam = self.pantsFinishOutseam.text!;
        pantsFinish.inseam = self.pantsFinishInseam.text!;
        
        //vest
        let vestBody : BodyMeasurements = BodyMeasurements();
        vestBody.chest = self.vestBodyChest.text!;
        vestBody.waist = self.vestBodyWaist.text!;
        vestBody.hips = self.vestBodyHips.text!;
        vestBody.shoulders = self.vestBodyShoulders.text!;
        
        let vestFinish : VestFinishMeasurements = VestFinishMeasurements();
        vestFinish.frontLength = self.vestFinishFrontLength.text!;
        vestFinish.backLength = self.vestFinishBackLength.text!;
        
        if let newOrders = self.suitOrders {
            for order in newOrders {
                order.jacketOrderInfo.bodyMeasurements = jacketBody;
                order.jacketOrderInfo.finishMeasurements = jacketFinish;
                order.pantsOrderInfo.bodyMeasurements = pantsBody;
                order.pantsOrderInfo.finishMeasurements = pantsFinish;
                order.vestOrderInfo?.bodyMeasurements = vestBody;
                order.vestOrderInfo?.finishMeasurements = vestFinish;
            }
            self.delegate?.didFinishCustomizingSuits(newOrders);
            self.navigationController?.popToRootViewControllerAnimated(true);
        }
        else if let existingOrder = self.existingSuit {
            existingOrder.jacketOrderInfo.bodyMeasurements = jacketBody;
            existingOrder.jacketOrderInfo.finishMeasurements = jacketFinish;
            existingOrder.pantsOrderInfo.bodyMeasurements = pantsBody;
            existingOrder.pantsOrderInfo.finishMeasurements = pantsFinish;
            existingOrder.vestOrderInfo?.bodyMeasurements = vestBody;
            existingOrder.vestOrderInfo?.finishMeasurements = vestFinish;
            
            self.delegate?.didFinishEditingSuit(existingOrder);
            self.navigationController?.popToRootViewControllerAnimated(true);
        }
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        keyboardWillShow();
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        keyboardWillHide();
    }
    
    func keyboardWillShow() {
        var frame = self.view.frame;
        frame.origin.y -= 264;
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.view.frame = frame;
            }, completion: nil)
        
    }

}
