//
//  SuitFabricModalViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 6/9/15.
//  Copyright © 2015 JPApps. All rights reserved.
//

import UIKit

protocol SuitFabricModalDelegate {
    func suitFabricModalFinishedAddingFabrics(suit:String, vest:String?) -> Void
}

class SuitFabricModalViewController: UIViewController {


    @IBOutlet weak var suitTextField: UITextField!
    @IBOutlet weak var vestTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    var delegate: SuitFabricModalDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cancelButton.layer.cornerRadius = HKTStyling.cornerRadiusMedium;
        self.doneButton.layer.cornerRadius = HKTStyling.cornerRadiusMedium;
    }

    @IBAction func doneButtonPressed(sender: AnyObject) {
        if self.suitTextField.text!.characters.count > 0 {
            let vestFabric : String? = self.vestTextField.text?.characters.count == 0 ? nil : self.vestTextField.text;
            self.delegate?.suitFabricModalFinishedAddingFabrics(self.suitTextField.text!, vest: vestFabric)
            self.dismissViewControllerAnimated(true, completion: nil);
        }

    }

    @IBAction func cancelButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }

}
