//
//  PantsOrderInfo.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 5/24/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit

class PantsOrderInfo: NSObject, OrderItemInterface {
    enum Pleat : String {
        case FlatFront = "Flat Front"
        case Single = "Single Pleat"
        case Double = "Double Pleat"
    }
    enum Lining : String {
        case Front = "Front Lining"
        case Full = "Full Lining"
        case None = "No Lining"
    }
    
    var itemType = OrderItemType.Pants;
    var fabric : String = "";
    var pleat : Pleat = Pleat.FlatFront;
    var lining : Lining = Lining.Front;
    var notes : String = "";
    
    var depthOfPleat : String = "";
    
    var bodyMeasurements : BodyMeasurements?;
    var finishMeasurements : PantsFinishMeasurements?;
    
    func convertToMailingString() -> String {
        var myString = "";
        myString += "Item Type: Custom Pants\n";
        myString += "Fabric: \(self.fabric)\n";
        myString += "Pleat Type: \(self.pleat.rawValue)\n";
        myString += "Lining: \(self.lining.rawValue)\n";
        if (count(self.depthOfPleat) > 0 && self.pleat != Pleat.FlatFront) {
            myString += "Depth of Pleat: \(self.depthOfPleat)\n";
        }
        myString += "Notes: \(self.notes)\n";
        if let finish = self.finishMeasurements {
            myString += "Finish Measurements:\n";
            myString += self.finishMeasurements!.convertToMailingString();
        }
        return myString;
    }
}
