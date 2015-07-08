//
//  BodyMeasurements.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 5/12/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit

class BodyMeasurements: NSObject, MeasurementsInterface {
    var chest : String = "";
    var waist = "";
    var hips = "";
    var shoulders : String = "";
    var seat : String = "";
    var crotch : String = "";
    var actualThigh : String = "";
    var outseam : String = "";
    var inseam : String = "";
    var shirtSleeveLength : String = "";
    var jacketSleeveLength : String = "";
    var shirtLength : String = "";
    var wrist : String = "";
    var neckSize : String = "";
    var jacketLength : String = "";
    var jacketWidth : String = "";
    var bicep : String = "";
    var armHole : String = "";
    var belly : String = "";
    
    func convertToMailingString() -> String {
        var myString = "";
        myString += "Chest: \(self.chest) \n";
        myString += "Waist: \(self.waist) \n";
        myString += "Hips: \(self.hips) \n";
        myString += "Shoulders: \(self.shoulders) \n";
        myString += "Seat: \(self.seat) \n";
        myString += "Crotch: \(self.crotch) \n";
        myString += "Actual Thigh: \(self.actualThigh) \n";
        myString += "Outseam: \(self.outseam) \n";
        myString += "Inseam: \(self.inseam) \n";
        myString += "Shirt Sleeve Length: \(self.shirtSleeveLength) \n";
        myString += "Jacket Sleeve Length: \(self.jacketSleeveLength) \n";
        myString += "Lenght of Shirt: \(self.shirtLength) \n";
        myString += "Wrist: \(self.wrist) \n";
        myString += "Neck Size: \(self.neckSize) \n";
        myString += "Length of Jacket: \(self.jacketLength) \n";
        myString += "Bicep: \(self.bicep)";
        myString += "Arm Hole: \(self.armHole) \n";
        myString += "Belly: \(self.belly) \n";
        
        return myString;
    }
    
//no longer needed?
//    func convertToShirtMailingString() -> String {
//        var myString = "";
//        myString += "Chest: \(self.chest) \n";
//        myString += "Waist: \(self.waist) \n";
//        myString += "Hips: \(self.hips) \n";
//        myString += "Shoulders: \(self.shoulders) \n";
//        myString += "Sleeve Length: \(self.sleeveLength) \n";
//        myString += "Lenght of Shirt: \(self.shirtLength) \n";
//        myString += "Wrist: \(self.wrist) \n";
//        myString += "Neck Size: \(self.neckSize) \n";
//        
//        return myString;
//    }
}
