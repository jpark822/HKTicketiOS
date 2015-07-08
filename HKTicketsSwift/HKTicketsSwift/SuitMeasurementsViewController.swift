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
    
    //vest
    @IBOutlet weak var vestContainerView: UIView!
    @IBOutlet weak var vestBodyChest: UITextField!
    @IBOutlet weak var vestBodyWaist: UITextField!
    @IBOutlet weak var vestBodyHips: UITextField!
    @IBOutlet weak var vestBodyShoulders: UITextField!
    
    @IBOutlet weak var vestFinishFrontLength: UITextField!
    @IBOutlet weak var vestFinishBackLength: UITextField!
    
    @IBOutlet weak var addSuitButton: UIButton!
    var suitOrders : [SuitOrderInfo]?;
    var existingSuit : SuitOrderInfo?;
    var delegate : OrderFormDelegate?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addSuitButton.layer.cornerRadius = HKTStyling.cornerRadiusMedium;
        
        self.jacketBodyChest.delegate = self;
        self.jacketBodyWaist.delegate = self;
        self.jacketBodyHips.delegate = self;
        self.jacketBodyShoulders.delegate = self;
        self.jacketBodySleeveLength.delegate = self;
        self.jacketBodyJacketWidth.delegate = self;
        self.jacketBodyJacketLength.delegate = self;
        self.jacketBodyBicep.delegate = self;
        self.jacketBodyArmHole.delegate = self;
        self.jacketBodyBelly.delegate = self;

        self.jacketFinishChest.delegate = self;
        self.jacketFinishWaist.delegate = self;
        self.jacketFinishHips.delegate = self;
        self.jacketFinishShoulders.delegate = self;
        self.jacketFinishSleeveLength.delegate = self;
        self.jacketFinishHalfShoulder.delegate = self;
        self.jacketFinishJacketLength.delegate = self;
        self.jacketFinishJacketSleeve.delegate = self;
        //pants
        self.pantsBodyWaist.delegate = self;
        self.pantsBodySeat.delegate = self;
        self.pantsBodyCrotch.delegate = self;
        self.pantsBodyActualThigh.delegate = self;
        self.pantsBodyOutseam.delegate = self;
        self.pantsBodyInseam.delegate = self;

        self.pantsFinishWaist.delegate = self;
        self.pantsFinishSeat.delegate = self;
        self.pantsFinishCrotch.delegate = self;
        self.pantsFinish1623below.delegate = self;
        self.pantsFinishBottomCuff.delegate = self;
        self.pantsFinishOutseam.delegate = self;
        self.pantsFinishInseam.delegate = self;
        //vest
        self.vestBodyChest.delegate = self;
        self.vestBodyWaist.delegate = self;
        self.vestBodyHips.delegate = self;
        self.vestBodyShoulders.delegate = self;
        
        if (self.suitOrders != nil) {
            if let body = self.delegate?.getBodyMeasurements(),
                let finish = self.delegate?.getFinishMeasurements() {
                    self.prepopulateTextFieldsWithBody(body, finishMeasurements: finish);
            }
        }

        else if let existingSuitOrder = self.existingSuit {
            self.prepopulateTextFieldsWithExistingSuitInfo(existingSuitOrder);
        }
        
        self.vestBodyChest.delegate = self;
        self.vestBodyWaist.delegate = self;
        self.vestBodyHips.delegate = self;
        self.vestBodyShoulders.delegate = self;
        self.vestFinishBackLength.delegate = self;
        self.vestFinishFrontLength.delegate = self;
    }
    
    func newSuitOrdersContainVest() ->Bool {
        var hasVest = false;
        for suit in self.suitOrders! {
            if (suit.vestOrderInfo != nil) {
                hasVest = true;
            }
        }
        return hasVest;
    }
    
    func keyboardWillHide() {
        var frame = self.view.frame;
        frame.origin.y += 264;
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.view.frame = frame;
            }, completion: nil)
    }
    
    func prepopulateTextFieldsWithExistingSuitInfo(suitInfo : SuitOrderInfo) {
        self.prepopulateBodyTextFieldsWithSuitOrderInfo(suitInfo);
        
        //jacket
        if let jacketFinishMeasurements = suitInfo.jacketOrderInfo.finishMeasurements {
            self.jacketFinishChest.text = jacketFinishMeasurements.chest;
            self.jacketFinishWaist.text = jacketFinishMeasurements.waist;
            self.jacketFinishHips.text = jacketFinishMeasurements.hips;
            self.jacketFinishShoulders.text = jacketFinishMeasurements.shoulders;
            self.jacketFinishSleeveLength.text = jacketFinishMeasurements.sleeveLength;
            self.jacketFinishHalfShoulder.text = jacketFinishMeasurements.halfShoulder;
            self.jacketFinishJacketLength.text = jacketFinishMeasurements.jacketLength;
            self.jacketFinishJacketSleeve.text = jacketFinishMeasurements.jacketSleeve;
        }
        
        //pants
        if let pantsFinishMeasurements = suitInfo.pantsOrderInfo.finishMeasurements {
            self.pantsFinishWaist.text = pantsFinishMeasurements.waist;
            self.pantsFinishSeat.text = pantsFinishMeasurements.seat;
            self.pantsFinishCrotch.text = pantsFinishMeasurements.crotch;
            self.pantsFinish1623below.text = pantsFinishMeasurements.below1623;
            self.pantsFinishBottomCuff.text = pantsFinishMeasurements.bottomCuff;
            self.pantsFinishOutseam.text = pantsFinishMeasurements.outseam;
            self.pantsFinishInseam.text = pantsFinishMeasurements.inseam;
        }
        
        //vest
        if let vestFinish = suitInfo.vestOrderInfo?.finishMeasurements {
            self.vestFinishFrontLength.text = vestFinish.frontLength;
            self.vestFinishBackLength.text = vestFinish.backLength;
        }
        else {
            self.vestContainerView.hidden = true;
        }
    }
    
    func prepopulateTextFieldsWithBody(bodyMeasurements : BodyMeasurements, finishMeasurements : FinishMeasurements) {
        self.prepopulateBodyTextFieldsWithBody(bodyMeasurements);
        
        //jacket
        self.jacketFinishChest.text = finishMeasurements.chest;
        self.jacketFinishWaist.text = finishMeasurements.waist;
        self.jacketFinishHips.text = finishMeasurements.hips;
        self.jacketFinishShoulders.text = finishMeasurements.shoulders;
        self.jacketFinishSleeveLength.text = finishMeasurements.jacketSleeveLength;
        self.jacketFinishHalfShoulder.text = finishMeasurements.jacketHalfShoulder;
        self.jacketFinishJacketLength.text = finishMeasurements.jacketLength;
        self.jacketFinishJacketSleeve.text = finishMeasurements.jacketSleeveWidth;
        
        //pants
        self.pantsFinishWaist.text = finishMeasurements.waist;
        self.pantsFinishSeat.text = finishMeasurements.pantSeat;
        self.pantsFinishCrotch.text = finishMeasurements.pantCrotch;
        self.pantsFinish1623below.text = finishMeasurements.pant1623below;
        self.pantsFinishBottomCuff.text = finishMeasurements.pantBottomCuff;
        self.pantsFinishOutseam.text = finishMeasurements.pantOutseam;
        self.pantsFinishInseam.text = finishMeasurements.pantInseam;
        
        //vest
        if (self.newSuitOrdersContainVest()) {
            self.vestFinishFrontLength.text = finishMeasurements.vestFrontLength;
            self.vestFinishBackLength.text = finishMeasurements.vestBackLength;
        }
        else {
            self.vestContainerView.hidden = true
        }
    }
    
    func prepopulateBodyTextFieldsWithBody(bodyMeasurements : BodyMeasurements) {
        //jacket
        self.jacketBodyChest.text = bodyMeasurements.chest;
        self.jacketBodyWaist.text = bodyMeasurements.waist;
        self.jacketBodyHips.text = bodyMeasurements.hips;
        self.jacketBodyShoulders.text = bodyMeasurements.shoulders;
        self.jacketBodySleeveLength.text = bodyMeasurements.jacketSleeveLength;
        self.jacketBodyJacketWidth.text = bodyMeasurements.jacketWidth;
        self.jacketBodyJacketLength.text = bodyMeasurements.jacketLength;
        self.jacketBodyBicep.text = bodyMeasurements.bicep;
        self.jacketBodyArmHole.text = bodyMeasurements.armHole;
        self.jacketBodyBelly.text = bodyMeasurements.belly;
        
        //pants
        self.pantsBodyWaist.text = bodyMeasurements.waist;
        self.pantsBodySeat.text = bodyMeasurements.seat;
        self.pantsBodyCrotch.text = bodyMeasurements.crotch;
        self.pantsBodyActualThigh.text = bodyMeasurements.actualThigh;
        self.pantsBodyOutseam.text = bodyMeasurements.outseam;
        self.pantsBodyInseam.text = bodyMeasurements.inseam
        
        //vest
        if self.newSuitOrdersContainVest() {
            self.vestBodyChest.text = bodyMeasurements.chest;
            self.vestBodyWaist.text = bodyMeasurements.waist;
            self.vestBodyHips.text = bodyMeasurements.hips;
            self.vestBodyShoulders.text = bodyMeasurements.shoulders;
        }
        else {
            self.vestContainerView.hidden = true;
        }
    }
    
    func prepopulateBodyTextFieldsWithSuitOrderInfo(suitInfo : SuitOrderInfo) {
        //jacket
        if let jacketBody = suitInfo.jacketOrderInfo.bodyMeasurements {
            self.jacketBodyChest.text = jacketBody.chest;
            self.jacketBodyWaist.text = jacketBody.waist;
            self.jacketBodyHips.text = jacketBody.hips;
            self.jacketBodyShoulders.text = jacketBody.shoulders;
            self.jacketBodySleeveLength.text = jacketBody.jacketSleeveLength;
            self.jacketBodyJacketWidth.text = jacketBody.jacketWidth;
            self.jacketBodyJacketLength.text = jacketBody.jacketLength;
            self.jacketBodyBicep.text = jacketBody.bicep;
            self.jacketBodyArmHole.text = jacketBody.armHole;
            self.jacketBodyBelly.text = jacketBody.belly;
        }
        
        //pants
        if let pantBody = suitInfo.pantsOrderInfo.bodyMeasurements {
            self.pantsBodyWaist.text = pantBody.waist;
            self.pantsBodySeat.text = pantBody.seat;
            self.pantsBodyCrotch.text = pantBody.crotch;
            self.pantsBodyActualThigh.text = pantBody.actualThigh;
            self.pantsBodyOutseam.text = pantBody.outseam;
            self.pantsBodyInseam.text = pantBody.inseam
        }
        
        //vest
        if let vestInfo = suitInfo.vestOrderInfo?.bodyMeasurements {
            self.vestBodyChest.text = vestInfo.chest;
            self.vestBodyWaist.text = vestInfo.waist;
            self.vestBodyHips.text = vestInfo.hips;
            self.vestBodyShoulders.text = vestInfo.shoulders;
        }
        else {
            self.vestContainerView.hidden = true
        }
    }
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        //jacket
        let jacketBody : BodyMeasurements = BodyMeasurements();
        jacketBody.chest = self.jacketBodyChest.text!;
        jacketBody.waist = self.jacketBodyWaist.text!;
        jacketBody.hips = self.jacketBodyHips.text!;
        jacketBody.shoulders = self.jacketBodyShoulders.text!;
        jacketBody.jacketSleeveLength = self.jacketBodySleeveLength.text!;
        jacketBody.jacketWidth = self.jacketBodyJacketWidth.text!;
        jacketBody.jacketLength = self.jacketBodyJacketLength.text!;
        jacketBody.bicep = self.jacketBodyBicep.text!;
        jacketBody.armHole = self.jacketBodyArmHole.text!;
        jacketBody.belly = self.jacketBodyBelly.text!;
        
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
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }

}
