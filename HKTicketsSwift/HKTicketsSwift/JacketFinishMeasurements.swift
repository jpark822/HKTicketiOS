//
//  JacketFinishMeasurements.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 6/3/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit

class JacketFinishMeasurements: NSObject, MeasurementsInterface {
    var chest : String = "";
    var waist : String = "";
    var hips : String = "";
    var shoulders : String = "";
    var sleeveLength : String = "";
    var halfShoulder : String = "";
    var jacketLength : String = "";
    var jacketSleeve : String = "";
    
    func convertToMailingString() -> String {
        var myString : String = "";
        myString += "Chest: \(self.chest)\n"
        myString += "Waist: \(self.waist)\n"
        myString += "Hips: \(self.hips)\n";
        myString += "Shoulders (Point to Point): \(self.shoulders)\n";
        myString += "Sleeve Length: \(self.sleeveLength)\n";
        myString += "Half Shoulder: \(self.halfShoulder)\n"
        myString += "Lenght Of Jacket: \(self.jacketLength)\n";
        myString += "Jacket Sleeve: \(self.jacketSleeve)\n";
        
        return myString
    }
   
}
