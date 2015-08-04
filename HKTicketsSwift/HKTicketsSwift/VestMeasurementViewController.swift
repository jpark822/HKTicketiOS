//
//  VestMeasurementViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 6/1/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit

class VestMeasurementViewController: UIViewController, UITextFieldDelegate, CustomerMeasurementChooserDelegate {
    
    @IBOutlet weak var bodyChest: UITextField!
    @IBOutlet weak var bodyWaist: UITextField!
    @IBOutlet weak var bodyHips: UITextField!
    @IBOutlet weak var bodyShoulders: UITextField!
    
    @IBOutlet weak var finishFrontLength: UITextField!
    @IBOutlet weak var finishBackLength: UITextField!
    @IBOutlet weak var addVestButton: UIButton!

    var vestOrders : [VestOrderInfo]?;
    var existingVest : VestOrderInfo?;
    var delegate : OrderFormDelegate?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addVestButton.layer.cornerRadius = HKTStyling.cornerRadiusMedium;
        
        self.bodyChest.delegate = self;
        self.bodyWaist.delegate = self;
        self.bodyHips.delegate = self;
        self.bodyShoulders.delegate = self;

        self.finishFrontLength.delegate = self;
        self.finishBackLength.delegate = self;
        
        if (self.vestOrders != nil) {
            if let body = self.delegate?.getBodyMeasurements(),
                let finish = self.delegate?.getInitialFinishMeasurements() {
                    self.prepopulateTextFieldsWithBody(body, finishMeasurements: finish);
            }
        }
        else if (existingVest != nil) {
            if let body = self.existingVest?.bodyMeasurements,
                let finish = self.existingVest?.finishMeasurements {
                    self.prepopulateTextFieldsWithBody(body, vestFinishMeasurements: finish);
            }
        }
    }
    
    func prepopulateTextFieldsWithBody(bodyMeasurements : BodyMeasurements, vestFinishMeasurements : VestFinishMeasurements) {
        self.prepopulateBodyTextFieldsWithBody(bodyMeasurements);
        
        self.finishFrontLength.text = vestFinishMeasurements.frontLength;
        self.finishBackLength.text = vestFinishMeasurements.backLength;
    }
    
    func prepopulateTextFieldsWithBody(bodyMeasurements : BodyMeasurements, finishMeasurements : FinishMeasurements) {
        self.prepopulateBodyTextFieldsWithBody(bodyMeasurements);
        
        self.prepopulateFinishTextFields(finishMeasurements);
    }
    
    func prepopulateBodyTextFieldsWithBody(bodyMeasurements : BodyMeasurements) {
        self.bodyChest.text = bodyMeasurements.chest;
        self.bodyWaist.text = bodyMeasurements.waist;
        self.bodyHips.text = bodyMeasurements.hips;
        self.bodyShoulders.text = bodyMeasurements.shoulders;
    }
    
    func prepopulateFinishTextFields(finishMeasurements : FinishMeasurements) {
        self.finishFrontLength.text = finishMeasurements.vestFrontLength;
        self.finishBackLength.text = finishMeasurements.vestBackLength;
    }

    @IBAction func doneButtonPressed(sender: AnyObject) {
        let body : BodyMeasurements = BodyMeasurements();
        body.chest = self.bodyChest.text!;
        body.waist = self.bodyWaist.text!;
        body.hips = self.bodyHips.text!;
        body.shoulders = self.bodyShoulders.text!;
        
        let finish : VestFinishMeasurements = VestFinishMeasurements();
        finish.frontLength = self.finishFrontLength.text!;
        finish.backLength = self.finishBackLength.text!;
        
        if let newOrders = self.vestOrders {
            for order in newOrders {
                order.bodyMeasurements = body;
                order.finishMeasurements = finish;
            }
            self.delegate?.didFinishCustomizingVests(newOrders);
            self.navigationController?.popToRootViewControllerAnimated(true);
        }
        else if let existingOrder = self.existingVest {
            existingOrder.bodyMeasurements = body;
            existingOrder.finishMeasurements = finish;
            
            self.delegate?.didFinishEditingVest(existingOrder);
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
