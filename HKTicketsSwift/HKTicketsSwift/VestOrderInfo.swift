//
//  VestOrderInfo.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 6/1/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit

class VestOrderInfo: NSObject, OrderItemInterface {
    enum VestType : String {
        case V1 = "V1"
        case V4 = "V4"
        case V6 = "V6"
        case V8 = "V8"
        case V12 = "V12"
        case Other = "Other"
    }
    
    var itemType = OrderItemType.Vest;
    var fabric : String = "";
    var vestType : VestType = VestType.Other;
    var firstButtonPosition = "";
    var notes = "";
    
    var bodyMeasurements : BodyMeasurements?;
    var finishMeasurements : VestFinishMeasurements?;
    
    func convertToMailingString() -> String {
        var myString = "";
        myString += "Item Type: \(self.itemType.rawValue)\n";
        myString += "Fabric: \(self.fabric)\n"
        myString += "Vest Type: \(self.vestType.rawValue)\n";
        if (self.firstButtonPosition.characters.count > 0) {
            myString += "First Button Position: \(self.firstButtonPosition)\n";
        }
        if (self.notes.characters.count > 0) {
            myString += "Notes: \(self.notes)\n";
        }
        if self.finishMeasurements != nil {
            myString += "Finish Measurements:\n";
            myString += self.finishMeasurements!.convertToMailingString();
        }
        return myString;
    }

}
