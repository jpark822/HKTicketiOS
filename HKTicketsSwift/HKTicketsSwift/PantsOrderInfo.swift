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
    var addExtension : Bool = true;
    
    var depthOfPleat : String = "";
    
    var bodyMeasurements : BodyMeasurements?;
    var finishMeasurements : PantsFinishMeasurements?;
    
    func convertToMailingString() -> String {
        var myString = "";
        myString += "Item Type: Custom Pants\n";
        myString += "Fabric: \(self.fabric)\n";
        switch (self.pleat) {
        case Pleat.FlatFront:
            myString += "Pleat Type: S-1 "
        case Pleat.Single:
            myString += "Pleat Type: S-2P w/ one pleat "
        case Pleat.Double:
            myString += "Pleat Type: S-2P "
        }
        
        if (self.addExtension) {
            myString += "/w extension \n";
        }
        else {
            myString += "\n";
        }
        
        myString += "Pleat Type: \(self.pleat.rawValue)\n";
        myString += "Lining: \(self.lining.rawValue)\n";
        if (self.depthOfPleat.characters.count > 0 && self.pleat != Pleat.FlatFront) {
            myString += "Depth of Pleat: \(self.depthOfPleat)\n";
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
