//
//  SuitFabricModalViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 6/9/15.
//  Copyright © 2015 JPApps. All rights reserved.
//

import UIKit

protocol SuitFabricModalDelegate {
    func suitFabricModalFinishedAddingFabrics(jacket:String, pants:String, vest:String) -> Void
}

class SuitFabricModalViewController: UIViewController {

    @IBOutlet weak var jacketTextField: UITextField!
    @IBOutlet weak var pantsTextField: UITextField!
    @IBOutlet weak var vestTextField: UITextField!
    
    var delegate: SuitFabricModalDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func doneButtonPressed(sender: AnyObject) {
        if self.jacketTextField.text!.characters.count > 0 && self.pantsTextField.text!.characters.count > 0 {
            self.delegate?.suitFabricModalFinishedAddingFabrics(self.jacketTextField.text!, pants: self.pantsTextField.text!, vest: self.vestTextField.text!);
            self.dismissViewControllerAnimated(true, completion: nil);
        }

    }

    @IBAction func cancelButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }

}
