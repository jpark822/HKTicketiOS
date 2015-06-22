//
//  SuitOrderInfo.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 6/9/15.
//  Copyright © 2015 JPApps. All rights reserved.
//

import UIKit

struct SuitFabricUnit {
    var suitFabric = "";
    var vestFabric : String?
}

class SuitOrderInfo: NSObject, OrderItemInterface {
    var itemType = OrderItemType.Suit;
    var fabric : String {
        get {
            return self.jacketOrderInfo.fabric;
        }
        set {
            
        }
    }
    
    var jacketOrderInfo = JacketOrderInfo();
    var pantsOrderInfo = PantsOrderInfo();
    var vestOrderInfo : VestOrderInfo?;
    
    var notes = "";
    
    func convertToMailingString() -> String {
        var myString = "";
        myString += "Item Type: Custom Suit\n";
        myString += self.jacketOrderInfo.convertToMailingString();
        myString += "\n";
        myString += self.pantsOrderInfo.convertToMailingString();
        myString += "\n";
        if (self.vestOrderInfo != nil) {
            myString += self.vestOrderInfo!.convertToMailingString();
            myString += "\n";
        }
        
        return myString;
    }
}
