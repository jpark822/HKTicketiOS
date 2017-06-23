//
//  FinishMeasurementsModel.swift
//  HKT
//
//  Created by Jay Park on 6/14/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import Foundation

struct FinishMeasurementsModel {
    var id : String = ""
    var name : String = "";
    var chest : String = ""
    var waist : String = ""
    var hips : String = ""
    var shoulders : String = ""
    
    //shirt
    var shirtSleeveLength : String = ""
    var shirtLength : String = ""
    var shirtCuff : String = ""
    var shirtNeck : String = ""
    var shirtWidth6Below : String = ""
    var shirtWidth12Below : String = ""
    
    //jacket
    var jacketSleeveLength : String = ""
    var jacketHalfShoulder : String = ""
    var jacketLength : String = ""
    var jacketSleeveWidth : String = ""
    
    //pants
    var pantSeat : String = ""
    var pantCrotch : String = ""
    var pant1623below : String = ""
    var pantBottomCuff : String = ""
    var pantOutseam : String = ""
    var pantInseam : String = ""
    
    //vest
    var vestFrontLength : String = ""
    var vestBackLength : String = ""
    
    fileprivate enum JSONPropertyKey:String {
        case IdKey = "id";
        case ChestKey = "finish_chest";
        case WaistKey = "finish_west";
        case HipsKey = "finish_hips";
        case ShouldersKey = "finish_shoulders";
        case ShirtSleeveLengthKey = "finish_shirt_sleeve_length";
        case ShirtCuffKey = "finish_shirt_cuff";
        case ShirtNeckKey = "finish_shirt_neck";
        case Shirt6BelowKey = "finish_shirt_6_below";
        case Shirt12BelowKey = "finish_shirt_12_below";
        case VestFrontKey = "finish_vest_front";
        case VestBackKey = "finish_vest_back";
        case JacketSleeveLengthKey = "finish_jacket_sleeve_length";
        case JacketHalfShoulderKey = "finish_jacket_half_shoulder";
        case JacketLengthKey = "finish_jacket_length";
        case JacketSleeveWidthKey = "finish_jacket_sleeve_width";
        case PantSeatKey = "finish_pant_seat";
        case PantCrotchKey = "finish_pant_crotch";
        case Pant1623BelowKey = "finish_pant_1623_below";
        case PantBottomCuffKey = "finish_pant_bottom_cuff";
        case PantOutseamKey = "finish_pant_outseam";
        case PantInseamKey = "finish_pant_inseam";
    }
    
    static func convertRawArrayOfFinishMeasurementsToFinishMeasurements(_response : [Dictionary<String, AnyObject>]) -> [FinishMeasurementsModel] {
        var finishMeasurements : [FinishMeasurementsModel] = [];
        
        //TODO fix when networking is up
        for rawMeasurementDict : Dictionary<String, AnyObject> in _response {
            if let measurementString = rawMeasurementDict["value"] as? String {
                let measurementDict = Dictionary<String, AnyObject>() //self.convertJsonStringIntoDictionary(measurementString);
                var finishMeasurement : FinishMeasurementsModel = FinishMeasurementsModel();
                finishMeasurement.chest = measurementDict[FinishMeasurementsModel.JSONPropertyKey.ChestKey.rawValue] as! String? ?? "";
                finishMeasurement.waist = measurementDict[FinishMeasurementsModel.JSONPropertyKey.WaistKey.rawValue] as! String? ?? "";
                finishMeasurement.hips = measurementDict[FinishMeasurementsModel.JSONPropertyKey.HipsKey.rawValue] as! String? ?? "";
                finishMeasurement.shoulders = measurementDict[FinishMeasurementsModel.JSONPropertyKey.ShouldersKey.rawValue] as! String? ?? "";
                finishMeasurement.shirtSleeveLength = measurementDict[FinishMeasurementsModel.JSONPropertyKey.ShirtSleeveLengthKey.rawValue] as! String? ?? "";
                finishMeasurement.shirtCuff = measurementDict[FinishMeasurementsModel.JSONPropertyKey.ShirtCuffKey.rawValue] as! String? ?? "";
                finishMeasurement.shirtNeck = measurementDict[FinishMeasurementsModel.JSONPropertyKey.ShirtNeckKey.rawValue] as! String? ?? "";
                finishMeasurement.shirtWidth6Below = measurementDict[FinishMeasurementsModel.JSONPropertyKey.Shirt6BelowKey.rawValue] as! String? ?? "";
                finishMeasurement.shirtWidth12Below = measurementDict[FinishMeasurementsModel.JSONPropertyKey.Shirt12BelowKey.rawValue] as! String? ?? "";
                finishMeasurement.vestBackLength = measurementDict[FinishMeasurementsModel.JSONPropertyKey.VestBackKey.rawValue] as! String? ?? "";
                finishMeasurement.vestFrontLength = measurementDict[FinishMeasurementsModel.JSONPropertyKey.VestFrontKey.rawValue] as! String? ?? "";
                finishMeasurement.jacketSleeveLength = measurementDict[FinishMeasurementsModel.JSONPropertyKey.JacketSleeveLengthKey.rawValue] as! String? ?? "";
                finishMeasurement.jacketHalfShoulder = measurementDict[FinishMeasurementsModel.JSONPropertyKey.JacketHalfShoulderKey.rawValue] as! String? ?? "";
                finishMeasurement.jacketLength = measurementDict[FinishMeasurementsModel.JSONPropertyKey.JacketLengthKey.rawValue] as! String? ?? "";
                finishMeasurement.jacketSleeveWidth = measurementDict[FinishMeasurementsModel.JSONPropertyKey.JacketSleeveWidthKey.rawValue] as! String? ?? "";
                finishMeasurement.pantSeat = measurementDict[FinishMeasurementsModel.JSONPropertyKey.PantSeatKey.rawValue] as! String? ?? "";
                finishMeasurement.pantCrotch = measurementDict[FinishMeasurementsModel.JSONPropertyKey.PantCrotchKey.rawValue] as! String? ?? "";
                finishMeasurement.pant1623below = measurementDict[FinishMeasurementsModel.JSONPropertyKey.Pant1623BelowKey.rawValue] as! String? ?? "";
                finishMeasurement.pantBottomCuff = measurementDict[FinishMeasurementsModel.JSONPropertyKey.PantBottomCuffKey.rawValue] as! String? ?? "";
                finishMeasurement.pantOutseam = measurementDict[FinishMeasurementsModel.JSONPropertyKey.PantOutseamKey.rawValue] as! String? ?? "";
                finishMeasurement.pantInseam = measurementDict[FinishMeasurementsModel.JSONPropertyKey.PantInseamKey.rawValue] as! String? ?? "";
                
                finishMeasurements.append(finishMeasurement);
            }
        }
        
        return finishMeasurements;
    }

}
