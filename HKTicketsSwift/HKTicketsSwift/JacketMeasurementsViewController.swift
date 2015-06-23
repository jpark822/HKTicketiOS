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
    
    var jacketOrders : [JacketOrderInfo]?;
    var existingJacket : JacketOrderInfo?;
    var delegate : OrderFormDelegate?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        if (self.existingJacket != nil) {
            self.prepopulateTextFields();
        }
    }
    
    func prepopulateTextFields() {
        let body = self.existingJacket?.bodyMeasurements;
        self.bodyChest.text = body?.chest;
        self.bodyWaist.text = body?.waist;
        self.bodyHips.text = body?.hips;
        self.bodyShoulders.text = body?.shoulders;
        self.bodySleeveLength.text = body?.sleeveLength;
        self.bodyJacketWidth.text = body?.jacketWidth;
        self.bodyJacketLength.text = body?.jacketLength;
        self.bodyBicep.text = body?.bicep;
        self.bodyArmHole.text = body?.armHole;
        self.bodyBelly.text = body?.belly;
        
        let finish = self.existingJacket?.finishMeasurements;
        self.finishChest.text = finish?.chest;
        self.finishWaist.text = finish?.waist;
        self.finishHips.text = finish?.hips;
        self.finishShoulders.text = finish?.shoulders;
        self.finishSleeveLength.text = finish?.sleeveLength;
        self.finishHalfShoulder.text = finish?.halfShoulder;
        self.finishJacketLength.text = finish?.jacketLength;
        self.finishJacketSleeve.text = finish?.jacketSleeve;
    }
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        let body : BodyMeasurements = BodyMeasurements();
        body.chest = self.bodyChest.text!;
        body.waist = self.bodyWaist.text!;
        body.hips = self.bodyHips.text!;
        body.shoulders = self.bodyShoulders.text!;
        body.sleeveLength = self.bodySleeveLength.text!;
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
