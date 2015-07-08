//
//  JacketMeasurementsViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 6/4/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit

class JacketMeasurementsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var bodyChest: UITextField!
    @IBOutlet weak var bodyWaist: UITextField!
    @IBOutlet weak var bodyHips: UITextField!
    @IBOutlet weak var bodyShoulders: UITextField!
    @IBOutlet weak var bodySleeveLength: UITextField!
    @IBOutlet weak var bodyJacketWidth: UITextField!
    @IBOutlet weak var bodyJacketLength: UITextField!
    @IBOutlet weak var bodyBicep: UITextField!
    @IBOutlet weak var bodyArmHole: UITextField!
    @IBOutlet weak var bodyBelly: UITextField!
    
    @IBOutlet weak var finishChest: UITextField!
    @IBOutlet weak var finishWaist: UITextField!
    @IBOutlet weak var finishHips: UITextField!
    @IBOutlet weak var finishShoulders: UITextField!
    @IBOutlet weak var finishSleeveLength: UITextField!
    @IBOutlet weak var finishHalfShoulder: UITextField!
    @IBOutlet weak var finishJacketLength: UITextField!
    @IBOutlet weak var finishJacketSleeve: UITextField!
    @IBOutlet weak var addJacketButton: UIButton!
    
    var jacketOrders : [JacketOrderInfo]?;
    var existingJacket : JacketOrderInfo?;
    var delegate : OrderFormDelegate?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addJacketButton.layer.cornerRadius = HKTStyling.cornerRadiusMedium;
        
        self.bodyChest.delegate = self;
        self.bodyWaist.delegate = self;
        self.bodyHips.delegate = self;
        self.bodyShoulders.delegate = self;
        self.bodySleeveLength.delegate = self;
        self.bodyJacketWidth.delegate = self;
        self.bodyJacketLength.delegate = self;
        self.bodyBicep.delegate = self;
        self.bodyArmHole.delegate = self;
        self.bodyBelly.delegate = self;

        self.finishChest.delegate = self;
        self.finishWaist.delegate = self;
        self.finishHips.delegate = self;
        self.finishShoulders.delegate = self;
        self.finishSleeveLength.delegate = self;
        self.finishHalfShoulder.delegate = self;
        self.finishJacketLength.delegate = self;
        self.finishJacketSleeve.delegate = self;
        
        if (self.jacketOrders != nil) {
            if let body = self.delegate?.getBodyMeasurements(),
                let finish = self.delegate?.getFinishMeasurements() {
                    self.prepopulateTextFieldsWithBody(body, finishMeasurements: finish);
            }
        }
        else if (self.existingJacket != nil) {
            if let body = self.existingJacket?.bodyMeasurements,
                let finish = self.existingJacket?.finishMeasurements {
                    self.prepopulateTextFieldsWithBody(body, jacketFinishMeasurements: finish);
            }
        }
    }
    
    func prepopulateTextFieldsWithBody(bodyMeasurements : BodyMeasurements, jacketFinishMeasurements : JacketFinishMeasurements){
        self.prepopulateTextFieldsWithBody(bodyMeasurements);
        
        self.finishChest.text = jacketFinishMeasurements.chest;
        self.finishWaist.text = jacketFinishMeasurements.waist;
        self.finishHips.text = jacketFinishMeasurements.hips;
        self.finishShoulders.text = jacketFinishMeasurements.shoulders;
        self.finishSleeveLength.text = jacketFinishMeasurements.sleeveLength;
        self.finishHalfShoulder.text = jacketFinishMeasurements.halfShoulder;
        self.finishJacketLength.text = jacketFinishMeasurements.jacketLength;
        self.finishJacketSleeve.text = jacketFinishMeasurements.jacketSleeve;
    }

    func prepopulateTextFieldsWithBody(bodyMeasurements : BodyMeasurements, finishMeasurements : FinishMeasurements) {
        self.prepopulateTextFieldsWithBody(bodyMeasurements);
        
        self.finishChest.text = finishMeasurements.chest;
        self.finishWaist.text = finishMeasurements.waist;
        self.finishHips.text = finishMeasurements.hips;
        self.finishShoulders.text = finishMeasurements.shoulders;
        self.finishSleeveLength.text = finishMeasurements.jacketSleeveLength;
        self.finishHalfShoulder.text = finishMeasurements.jacketHalfShoulder;
        self.finishJacketLength.text = finishMeasurements.jacketLength;
        self.finishJacketSleeve.text = finishMeasurements.jacketSleeveWidth;
    }
    
    func prepopulateTextFieldsWithBody(bodyMeasurements : BodyMeasurements) {
        self.bodyChest.text = bodyMeasurements.chest;
        self.bodyWaist.text = bodyMeasurements.waist;
        self.bodyHips.text = bodyMeasurements.hips
        self.bodyShoulders.text = bodyMeasurements.shoulders
        self.bodySleeveLength.text = bodyMeasurements.jacketSleeveLength
        self.bodyJacketWidth.text = bodyMeasurements.jacketWidth
        self.bodyJacketLength.text = bodyMeasurements.jacketLength
        self.bodyBicep.text = bodyMeasurements.bicep
        self.bodyArmHole.text = bodyMeasurements.armHole
        self.bodyBelly.text = bodyMeasurements.belly
    }
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        let body : BodyMeasurements = BodyMeasurements();
        body.chest = self.bodyChest.text!;
        body.waist = self.bodyWaist.text!;
        body.hips = self.bodyHips.text!;
        body.shoulders = self.bodyShoulders.text!;
        body.jacketSleeveLength = self.bodySleeveLength.text!;
        body.jacketWidth = self.bodyJacketWidth.text!;
        body.jacketLength = self.bodyJacketLength.text!;
        body.bicep = self.bodyBicep.text!;
        body.armHole = self.bodyArmHole.text!;
        body.belly = self.bodyBelly.text!
        ;

        let finish : JacketFinishMeasurements = JacketFinishMeasurements();
        finish.chest = self.finishChest.text!;
        finish.waist = self.finishWaist.text!;
        finish.hips = self.finishHips.text!;
        finish.shoulders = self.finishShoulders.text!;
        finish.sleeveLength = self.finishSleeveLength.text!;
        finish.halfShoulder = self.finishHalfShoulder.text!;
        finish.jacketLength = self.finishJacketLength.text!;
        finish.jacketSleeve = self.finishJacketSleeve.text!;
        
        if let newOrders = self.jacketOrders {
            for order in newOrders {
                order.bodyMeasurements = body;
                order.finishMeasurements = finish;
            }
            self.delegate?.didFinishCustomizingJackets(newOrders);
            self.navigationController?.popToRootViewControllerAnimated(true);
        }
        else if let existingOrder = self.existingJacket {
            existingOrder.bodyMeasurements = body;
            existingOrder.finishMeasurements = finish;
            self.delegate?.didFinishEditingJacket(existingOrder);
            self.navigationController?.popToRootViewControllerAnimated(true);
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
}
