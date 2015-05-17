//
//  ShirtFinishMeasurements.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 5/12/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit

class ShirtFinishMeasurements: NSObject, MeasurementsInterface {
    var chest : String = "";
    var waist = "";
    var hips = "";
    var shoulders : String = "";
    var sleeveLength : String = "";
    var shirtLength : String = "";
    var cuff : String = "";
    var neckSize : String = "";
    var sleeveWidth6Below : String = "";
    var sleeveWidth12Below : String = "";
    
    func convertToMailingString() -> String {
        var myString = "";
        myString += "Chest: \(self.chest) \n";
        myString += "Waist: \(self.waist) \n";
        myString += "Hips: \(self.hips) \n";
        myString += "Shoulders: \(self.shoulders) \n";
        myString += "Sleeve Length: \(self.sleeveLength) \n";
        myString += "Lenght of Shirt: \(self.shirtLength) \n";
        myString += "Cuff: \(self.cuff) \n";
        myString += "Neck Size: \(self.neckSize) \n";
        myString += "Sleeve Width 6 Below: \(self.sleeveWidth6Below) \n";
        myString += "Sleeve Width 12 Below: \(self.sleeveWidth12Below) \n";
        
        
        return myString;
    }
}
