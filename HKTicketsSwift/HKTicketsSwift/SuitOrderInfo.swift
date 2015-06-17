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
    
    var jacketFinishMeasurements = JacketFinishMeasurements();
    var pantsFinishMeasurements = PantsFinishMeasurements();
    var vestFinishMeasurements : VestFinishMeasurements?;
    
    var notes = "";
    
    func convertToMailingString() -> String {
        return "";
    }
}
