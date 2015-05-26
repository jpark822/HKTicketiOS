//
//  PantMeasurementViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 5/25/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit

class PantMeasurementViewController: UIViewController {

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
    
    var pantOrders : [PantsOrderInfo]?;
    var existingPants : PantsOrderInfo?;
    var delegate : OrderFormDelegate?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (existingPants != nil) {
            self.prepopulateTextFields();
        }
    }
    
    func prepopulateTextFields() {
        let body = self.existingPants?.bodyMeasurements;
        self.bodyWaist.text = body!.waist;
        self.bodySeat.text = body!.seat;
        self.bodyCrotch.text = body!.crotch;
        self.bodyActualThigh.text = body!.actualThigh;
        self.bodyOutseam.text = body!.outseam;
        self.bodyInseam.text = body!.inseam
        
        let finish = self.existingPants?.finishMeasurements;
        self.finishWaist.text = finish!.waist;
        self.finishSeat.text = finish!.seat;
        self.finishCrotch.text = finish!.crotch;
        self.Finish1623below.text = finish!.below1623;
        self.finishBottomCuff.text = finish!.bottomCuff;
        self.finishOutseam.text = finish!.outseam;
        self.finishInseam.text = finish!.inseam;
    }
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        var body : BodyMeasurements = BodyMeasurements();
        body.waist = self.bodyWaist.text;
        body.seat = self.bodySeat.text;
        body.crotch = self.bodyCrotch.text;
        body.actualThigh = self.bodyActualThigh.text;
        body.outseam = self.bodyOutseam.text;
        body.inseam = self.bodyInseam.text;
        
        var finish : PantsFinishMeasurements = PantsFinishMeasurements();
        finish.waist = self.finishWaist.text;
        finish.seat = self.finishSeat.text;
        finish.crotch = self.finishCrotch.text;
        finish.below1623 = self.Finish1623below.text;
        finish.bottomCuff = self.finishBottomCuff.text;
        finish.outseam = self.finishOutseam.text;
        finish.inseam = self.finishInseam.text;
        
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
}
