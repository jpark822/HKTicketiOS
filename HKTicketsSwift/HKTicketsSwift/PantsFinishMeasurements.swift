//
//  PantsFinishMeasurements.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 5/25/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit

class PantsFinishMeasurements: NSObject, MeasurementsInterface {
    
    var waist : String = "";
    var seat : String = "";
    var crotch : String = "";
    var below1623 : String = "";
    var bottomCuff : String = "";
    var outseam : String = "";
    var inseam : String = "";
   
    func convertToMailingString() -> String {
        var myString = "";
        myString += "Waist: \(self.waist)\n";
        myString += "Seat: \(self.seat)\n";
        myString += "Crotch: \(self.crotch)\n";
        myString += "16\",23\" below: \(self.below1623)\n";
        myString += "Bottom Cuff: \(self.bottomCuff)\n";
        myString += "Outseam: \(self.outseam)\n";
        myString += "Inseam: \(self.inseam)\n";
        
        return myString;
    }
}
