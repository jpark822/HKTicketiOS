//
//  SuitOrderInfo.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 6/9/15.
//  Copyright © 2015 JPApps. All rights reserved.
//

import UIKit

struct SuitFabricUnit {
    var jacketFabric = ""
    var pantFabric = ""
    var vestFabric = ""
}

class SuitOrderInfo: NSObject {
    var jacketOrderInfo = JacketOrderInfo();
    var pantsOrderInfo = PantsOrderInfo();
    var vestOrderInfo : VestOrderInfo?;
    
    var jacketFinishMeasurements = JacketFinishMeasurements();
    var pantsFinishMeasurements = PantsFinishMeasurements();
    var vestFinishMeasurements : VestFinishMeasurements?;
}
