//
//  PantMeasurementViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 5/25/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit

class PantMeasurementViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var bodyWaist: UITextField!
    @IBOutlet weak var bodySeat: UITextField!
    @IBOutlet weak var bodyCrotch: UITextField!
    @IBOutlet weak var bodyActualThigh: UITextField!
    @IBOutlet weak var bodyOutseam: UITextField!
    @IBOutlet weak var bodyInseam: UITextField!
    
    @IBOutlet weak var finishWaist: UITextField!
    @IBOutlet weak var finishSeat: UITextField!
    @IBOutlet weak var finishCrotch: UITextField!
    @IBOutlet weak var Finish1623below: UITextField!
    @IBOutlet weak var finishBottomCuff: UITextField!
    @IBOutlet weak var finishOutseam: UITextField!
    @IBOutlet weak var finishInseam: UITextField!
    @IBOutlet weak var addPantsButton: UIButton!
    
    var pantOrders : [PantsOrderInfo]?;
    var existingPants : PantsOrderInfo?;
    var delegate : OrderFormDelegate?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addPantsButton.layer.cornerRadius = HKTStyling.cornerRadiusMedium;
        
        self.bodyWaist.delegate = self;
        self.bodySeat.delegate = self;
        self.bodyCrotch.delegate = self;
        self.bodyActualThigh.delegate = self;
        self.bodyOutseam.delegate = self;
        self.bodyInseam.delegate = self;

        self.finishWaist.delegate = self;
        self.finishSeat.delegate = self;
        self.finishCrotch.delegate = self;
        self.Finish1623below.delegate = self;
        self.finishBottomCuff.delegate = self;
        self.finishOutseam.delegate = self;
        self.finishInseam.delegate = self;
        
        if (self.pantOrders != nil) {
            if let body = self.delegate?.getBodyMeasurements(),
             let finish = self.delegate?.getFinishMeasurements() {
                self.prepopulateTextFieldsWithBody(body, finishMeasurements: finish);
            }
        }
        if (existingPants != nil) {
            if let body = self.existingPants?.bodyMeasurements,
                let finish = self.existingPants?.finishMeasurements {
                    self.prepopulateTextFieldsWithBody(body, pantsFinishMeasurements: finish);
            }
        }
        //else use delegate to get body measurements
    }
    
    func prepopulateTextFieldsWithBody(bodyMeasurements : BodyMeasurements, pantsFinishMeasurements : PantsFinishMeasurements) {
        self.prepopulateBodyTextFieldsWithBody(bodyMeasurements);
        self.finishWaist.text = pantsFinishMeasurements.waist;
        self.finishSeat.text = pantsFinishMeasurements.seat;
        self.finishCrotch.text = pantsFinishMeasurements.crotch;
        self.Finish1623below.text = pantsFinishMeasurements.below1623;
        self.finishBottomCuff.text = pantsFinishMeasurements.bottomCuff;
        self.finishOutseam.text = pantsFinishMeasurements.outseam;
        self.finishInseam.text = pantsFinishMeasurements.inseam;
    }
    
    func prepopulateTextFieldsWithBody(bodyMeasurements : BodyMeasurements, finishMeasurements : FinishMeasurements) {
        self.prepopulateBodyTextFieldsWithBody(bodyMeasurements);
        self.finishWaist.text = finishMeasurements.waist;
        self.finishSeat.text = finishMeasurements.pantSeat;
        self.finishCrotch.text = finishMeasurements.pantCrotch;
        self.Finish1623below.text = finishMeasurements.pant1623below;
        self.finishBottomCuff.text = finishMeasurements.pantBottomCuff;
        self.finishOutseam.text = finishMeasurements.pantOutseam;
        self.finishInseam.text = finishMeasurements.pantInseam;
    }
    
    func prepopulateBodyTextFieldsWithBody(bodyMeasurements : BodyMeasurements) {
        self.bodyWaist.text = bodyMeasurements.waist;
        self.bodySeat.text = bodyMeasurements.seat;
        self.bodyCrotch.text = bodyMeasurements.crotch;
        self.bodyActualThigh.text = bodyMeasurements.actualThigh;
        self.bodyOutseam.text = bodyMeasurements.outseam;
        self.bodyInseam.text = bodyMeasurements.inseam
    }
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        let body : BodyMeasurements = BodyMeasurements();
        body.waist = self.bodyWaist.text!;
        body.seat = self.bodySeat.text!;
        body.crotch = self.bodyCrotch.text!;
        body.actualThigh = self.bodyActualThigh.text!;
        body.outseam = self.bodyOutseam.text!;
        body.inseam = self.bodyInseam.text!;
        
        let finish : PantsFinishMeasurements = PantsFinishMeasurements();
        finish.waist = self.finishWaist.text!;
        finish.seat = self.finishSeat.text!;
        finish.crotch = self.finishCrotch.text!;
        finish.below1623 = self.Finish1623below.text!;
        finish.bottomCuff = self.finishBottomCuff.text!;
        finish.outseam = self.finishOutseam.text!;
        finish.inseam = self.finishInseam.text!;
        
        if let newPantOrders = self.pantOrders {
            for pants in newPantOrders {
                pants.bodyMeasurements = body;
                pants.finishMeasurements = finish;
            }
            self.delegate?.didFinishCustomizingPants(newPantOrders);
            self.navigationController?.popToRootViewControllerAnimated(true);
        }
        else if let existingPantsOrder = self.existingPants {
            existingPantsOrder.bodyMeasurements = body;
            existingPantsOrder.finishMeasurements = finish;
            
            self.delegate?.didFinishEditingPants(existingPantsOrder);
            self.navigationController?.popToRootViewControllerAnimated(true);
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
}
