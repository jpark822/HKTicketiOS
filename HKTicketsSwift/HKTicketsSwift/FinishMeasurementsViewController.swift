//
//  FinishMeasurementsViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 7/26/15.
//  Copyright © 2015 JPApps. All rights reserved.
//

import UIKit

class FinishMeasurementsViewController: UIViewController {
    
    var finishMeasurement : FinishMeasurements?
    var customer : Customer = Customer();
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var waistTextField: UITextField!
    @IBOutlet weak var chestTextField: UITextField!
    @IBOutlet weak var hipsTextField: UITextField!
    @IBOutlet weak var shouldersTextField: UITextField!
    @IBOutlet weak var shirtSleeveLengthTextField: UITextField!
    @IBOutlet weak var shirtCuffTextField: UITextField!
    @IBOutlet weak var shirtNeckTextField: UITextField!
    @IBOutlet weak var sleeve6BelowTextField: UITextField!
    @IBOutlet weak var sleeve12BelowTextField: UITextField!
    @IBOutlet weak var vestFrontTextField: UITextField!
    @IBOutlet weak var vestBackTextField: UITextField!
    @IBOutlet weak var jacketSleeveLengthTextField: UITextField!
    @IBOutlet weak var jacketHalfShoulderTextField: UITextField!
    @IBOutlet weak var jacketLengthTextField: UITextField!
    @IBOutlet weak var jacketSleeveWidthTextField: UITextField!
    @IBOutlet weak var PantSeatTextField: UITextField!
    @IBOutlet weak var pantCrotchTextField: UITextField!
    @IBOutlet weak var pant1623BelowTextField: UITextField!
    @IBOutlet weak var pantBottomCuffTextField: UITextField!
    @IBOutlet weak var pantOutseamTextField: UITextField!
    @IBOutlet weak var pantInseamTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.becomeFirstResponder();
        if let finish = self.finishMeasurement {
            self.prepopulateTextFields(finish);
        }
    }
    
    func prepopulateTextFields(finish : FinishMeasurements) {
        self.nameTextField.text = finish.name;
        self.chestTextField.text = finish.chest;
        self.waistTextField.text = finish.waist;
        self.hipsTextField.text = finish.hips;
        self.shouldersTextField.text = finish.shoulders;
        self.shirtSleeveLengthTextField.text = finish.shirtSleeveLength;
        self.shirtCuffTextField.text = finish.shirtCuff;
        self.shirtNeckTextField.text = finish.shirtNeck;
        self.sleeve6BelowTextField.text = finish.shirtWidth6Below;
        self.sleeve12BelowTextField.text = finish.shirtWidth12Below;
        self.vestFrontTextField.text = finish.vestFrontLength;
        self.vestBackTextField.text = finish.vestBackLength;
        self.jacketSleeveLengthTextField.text = finish.jacketSleeveLength;
        self.jacketHalfShoulderTextField.text = finish.jacketHalfShoulder;
        self.jacketLengthTextField.text = finish.jacketLength;
        self.jacketSleeveWidthTextField.text = finish.jacketSleeveWidth;
        self.PantSeatTextField.text = finish.pantSeat;
        self.pantCrotchTextField.text = finish.pantCrotch;
        self.pant1623BelowTextField.text = finish.pant1623below;
        self.pantBottomCuffTextField.text = finish.pantBottomCuff;
        self.pantOutseamTextField.text = finish.pantOutseam;
        self.pantInseamTextField.text = finish.pantInseam;
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true);
    }
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        let newFinishMeasurements = FinishMeasurements();
        newFinishMeasurements.chest = self.chestTextField.text!;
        newFinishMeasurements.waist = self.waistTextField.text!
        newFinishMeasurements.hips = self.hipsTextField.text!
        newFinishMeasurements.shoulders = self.shouldersTextField.text!
        newFinishMeasurements.shirtSleeveLength = self.shirtSleeveLengthTextField.text!
        newFinishMeasurements.shirtCuff = self.shirtCuffTextField.text!
        newFinishMeasurements.shirtNeck = self.shirtNeckTextField.text!
        newFinishMeasurements.shirtWidth6Below = self.sleeve6BelowTextField.text!
        newFinishMeasurements.shirtWidth12Below = self.sleeve12BelowTextField.text!
        newFinishMeasurements.vestFrontLength = self.vestFrontTextField.text!
        newFinishMeasurements.vestBackLength = self.vestBackTextField.text!
        newFinishMeasurements.jacketSleeveLength = self.jacketSleeveLengthTextField.text!
        newFinishMeasurements.jacketHalfShoulder = self.jacketHalfShoulderTextField.text!
        newFinishMeasurements.jacketLength = self.jacketLengthTextField.text!
        newFinishMeasurements.jacketSleeveWidth = self.jacketSleeveWidthTextField.text!
        newFinishMeasurements.pantSeat = self.PantSeatTextField.text!
        newFinishMeasurements.pantCrotch = self.pantCrotchTextField.text!
        newFinishMeasurements.pant1623below = self.pant1623BelowTextField.text!
        newFinishMeasurements.pantBottomCuff = self.pantBottomCuffTextField.text!
        newFinishMeasurements.pantOutseam = self.pantOutseamTextField.text!
        newFinishMeasurements.pantInseam = self.pantInseamTextField.text!
        
        if let existingFinishMeasurements = self.finishMeasurement {
            //PUT and update
        }
        else {
            //POST new finish measurements
        }

    }

}
