//
//  BaseViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 5/10/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow", name: UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide", name: UIKeyboardWillHideNotification, object: nil);
    }

    func keyboardWillShow() {
        var frame = self.view.frame;
        frame.origin.y -= 264;
        self.view.frame = frame;
    }
    
    func keyboardWillHide() {
        var frame = self.view.frame;
        frame.origin.y += 264;
        self.view.frame = frame;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
