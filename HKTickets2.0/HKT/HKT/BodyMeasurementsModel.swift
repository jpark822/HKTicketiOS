//
//  BodyMeasurementsModel.swift
//  HKT
//
//  Created by Jay Park on 5/23/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import Foundation

struct BodyMeasurementsModel {
    
    var id : String = "";
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
    
    fileprivate enum JSONPropertyKey:String {
        case ChestKey = "body_chest"
        case WaistKey = "body_waist"
        case HipsKey = "body_hips"
        case ShouldersKey = "body_shoulders"
        case SeatKey = "body_seat"
        case CrotchKey = "body_crotch"
        case ActualThighKey = "body_actual_thigh"
        case OutseamKey = "body_outseam"
        case InseamKey = "body_inseam"
        case ShirtSleeveLengthKey = "body_shirt_sleeve_length"
        case JacketSleeveLengthKey = "body_jacket_sleeve_length"
        case ShirtLengthKey = "body_shirt_length"
        case WristKey = "body_wrist"
        case NeckSizeKey = "body_neck"
        case JacketLengthKey = "body_jacket_length"
        case JacketWidthKey = "body_jacket_width"
        case BicepKey = "body_bicep"
        case ArmHoleKey = "body_arm_hole"
        case BellyKey = "body_belly"
    }
    
    /* Not available until we implement receipts
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
    */
    
    
}
