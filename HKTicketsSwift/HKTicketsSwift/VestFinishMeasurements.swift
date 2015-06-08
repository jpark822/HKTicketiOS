//
//  VestFinishMeasurements.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 6/1/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit

class VestFinishMeasurements: NSObject, MeasurementsInterface {
    var frontLength = "";
    var backLength = "";
    
    func convertToMailingString() -> String {
        var myString = "";
        myString += "Front Length: \(self.frontLength)\n";
        myString += "Back Length: \(self.backLength)\n";
        return myString;
    }
}
