//
//  ServiceManager.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 7/21/15.
//  Copyright © 2015 JPApps. All rights reserved.
//

import UIKit
import AFNetworking

enum CustomerQueryParam : String {
    case FirstName = "first_name"
    case LastName = "last_name"
    case MiddleName = "middle_name"
    case Phone = "phone"
    case Email = "email"
    case Address = "address"
    case City = "city"
    case State = "state"
    case Zip = "zip"
};

class ServiceManager: NSObject {
    static let sharedManager : ServiceManager = ServiceManager();
    
    var sessionManager : AFHTTPSessionManager = AFHTTPSessionManager()
    
    //id most likely needs changing
    let kFinishIdKey = "id";
    let kFinishChestKey = "finish_chest";
    let kFinishWaistKey = "finish_west";
    let kFinishHipsKey = "finish_hips";
    let kFinishShouldersKey = "finish_shoulders";
    let kFinishShirtSleeveLengthKey = "finish_shirt_sleeve_length";
    let kFinishShirtCuffKey = "finish_shirt_cuff";
    let kFinishShirtNeckKey = "finish_shirt_neck";
    let kFinishShirt6BelowKey = "finish_shirt_6_below";
    let kFinishShirt12BelowKey = "finish_shirt_12_below";
    let kFinishVestFrontKey = "finish_vest_front";
    let kFinishVestBackKey = "finish_vest_back";
    let kFinishJacketSleeveLengthKey = "finish_jacket_sleeve_length";
    let kFinishJacketHalfShoulderKey = "finish_jacket_half_shoulder";
    let kFinishJacketLengthKey = "finish_jacket_length";
    let kFinishJacketSleeveWidthKey = "finish_jacket_sleeve_width";
    let kFinishPantSeatKey = "finish_pant_seat";
    let kFinishPantCrotchKey = "finish_pant_crotch";
    let kFinishPant1623BelowKey = "finish_pant_1623_below";
    let kFinishPantBottomCuffKey = "finish_pant_bottom_cuff";
    let kFinishPantOutseamKey = "finish_pant_outseam";
    let kFinishPantInseamKey = "finish_pant_inseam";
    
    //id most likely needs changing
    let kBodyIdKey = "id";
    let kBodyChestKey = "body_chest";
    let kBodyWaistKey = "body_waist";
    let kBodyHipsKey = "body_hips";
    let kBodyShouldersKey = "body_shoulders";
    let kBodySeatKey = "body_seat";
    let kBodyCrotchKey = "body_crotch";
    let kBodyActualThighKey = "body_actual_thigh";
    let kBodyOutseamKey = "body_outseam";
    let kBodyInseamKey = "body_inseam";
    let kBodyShirtSleeveLengthKey = "body_shirt_sleeve_length";
    let kBodyJacketSleeveLengthKey = "body_jacket_sleeve_length";
    let kBodyShirtLengthKey = "body_shirt_length";
    let kBodyWristKey = "body_wrist";
    let kBodyNeckSizeKey = "body_neck";
    let kBodyJacketLengthKey = "body_jacket_length";
    let kBodyJacketWidthKey = "body_jacket_width";
    let kBodyBicepKey = "body_bicep";
    let kBodyArmHoleKey = "body_arm_hole";
    let kBodyBellyKey = "body_belly";
    
    override init() {
        let config = NSURLSessionConfiguration.defaultSessionConfiguration();
        config.HTTPAdditionalHeaders = ["Authorization" : "amF5OnBhcms="];
        
        self.sessionManager = AFHTTPSessionManager(baseURL: NSURL(string: "https://hkt.azurewebsites.net/api"), sessionConfiguration: config);
        self.sessionManager.requestSerializer = AFJSONRequestSerializer();
        self.sessionManager.responseSerializer = AFJSONResponseSerializer();
    }
    
    func getCustomersBySearchParameters(_paramDict : [CustomerQueryParam : String], success: ([Customer] -> ()), failure: (NSError!) -> ()) -> Void {
        
        var serializedParamDict = Dictionary<String, String>();
        for (key, value) in _paramDict {
            serializedParamDict[key.rawValue] = value;
        }
        
        self.sessionManager.GET("Customers", parameters: serializedParamDict, success: { (task : NSURLSessionTask!, response) -> Void in
            let responseArray = response as! [Dictionary<String, AnyObject>];
            let customerArray = Customer.customersWithArrayOfDictionaries(responseArray);
            success(customerArray);
            
            }) { (task : NSURLSessionTask!, error) -> Void in
                failure(error);
        }
    }
    
    func getBodyMeasurementsByCustomerId(_customerId : String, success : (BodyMeasurements -> ()), failure : (NSError!) -> ()) {
        let body = BodyMeasurements();
        body.chest = "1";
        body.waist = "2";
        body.hips = "3";
        body.shoulders = "4";
        body.seat = "18";
        body.crotch = "19";
        body.actualThigh = "5";
        body.outseam = "6";
        body.inseam = "7";
        body.shirtSleeveLength = "8";
        body.jacketSleeveLength = "9";
        body.shirtLength = "10";
        body.wrist = "11";
        body.neckSize = "12";
        body.jacketLength = "13";
        body.jacketWidth = "14";
        body.bicep = "15";
        body.armHole = "16";
        body.belly = "17";
        
        success(body);
    }
    
    func getFinishMeasurementsByCustomerId(_customerId : String, success : ([FinishMeasurements] -> ()), failure : (NSError!) -> ()) {
        let finish = FinishMeasurements();
        finish.chest = "1";
        finish.waist = "2";
        finish.waist = "3";
        finish.hips = "4";
        finish.shoulders = "5";
        finish.shirtSleeveLength = "6"
        finish.shirtLength = "7";
        finish.shirtCuff = "8";
        finish.shirtNeck = "9";
        finish.shirtWidth6Below = "10";
        finish.shirtWidth12Below = "11";
        finish.jacketSleeveLength = "12";
        finish.jacketHalfShoulder = "13";
        finish.jacketLength = "14";
        finish.jacketSleeveWidth = "15";
        finish.pantSeat = "16";
        finish.pantCrotch = "17";
        finish.pant1623below = "18";
        finish.pantBottomCuff = "19";
        finish.pantOutseam = "20";
        finish.pantInseam = "21";
        finish.vestFrontLength = "22";
        finish.vestBackLength = "23";
        finish.name = "Customer standard measurements";
        finish.measurementId = "customerStandardFinishId";
        
        let finish2 = FinishMeasurements();
        finish2.chest = "1";
        finish2.waist = "2";
        finish2.waist = "3";
        finish2.hips = "4";
        finish2.shoulders = "5";
        finish2.shirtSleeveLength = "6"
        finish2.shirtLength = "7";
        finish2.shirtCuff = "8";
        finish2.shirtNeck = "9";
        finish2.shirtWidth6Below = "10";
        finish2.shirtWidth12Below = "11";
        finish2.jacketSleeveLength = "12";
        finish2.jacketHalfShoulder = "13";
        finish2.jacketLength = "14";
        finish2.jacketSleeveWidth = "15";
        finish2.pantSeat = "16";
        finish2.pantCrotch = "17";
        finish2.pant1623below = "18";
        finish2.pantBottomCuff = "19";
        finish2.pantOutseam = "20";
        finish2.pantInseam = "21";
        finish2.vestFrontLength = "22";
        finish2.vestBackLength = "23";
        finish2.name = "Customer slim fit measurements";
        finish2.measurementId = "customerSlimFinishId";
        
        success([finish, finish2]);
    }
    
    func addFinishMeasurementsForCustomer(_customerId : String, finishMeasurements : FinishMeasurements, success : ((responseDict : Dictionary<String, AnyObject>) -> ()), failure : (NSError!) -> ()) {
        var postBody = Dictionary<String, String>();
        postBody[kFinishChestKey] = finishMeasurements.chest;
        postBody[kFinishWaistKey] = finishMeasurements.waist;
        postBody[kFinishHipsKey] = finishMeasurements.hips;
        postBody[kFinishShouldersKey] = finishMeasurements.shoulders;
        postBody[kFinishShirtSleeveLengthKey] = finishMeasurements.shirtSleeveLength;
        postBody[kFinishShirtCuffKey] = finishMeasurements.shirtCuff;
        postBody[kFinishShirtNeckKey] = finishMeasurements.shirtNeck;
        postBody[kFinishShirt6BelowKey] = finishMeasurements.shirtWidth6Below;
        postBody[kFinishShirt12BelowKey] = finishMeasurements.shirtWidth12Below;
        postBody[kFinishVestBackKey] = finishMeasurements.vestBackLength;
        postBody[kFinishVestFrontKey] = finishMeasurements.vestFrontLength;
        postBody[kFinishJacketSleeveLengthKey] = finishMeasurements.jacketSleeveLength;
        postBody[kFinishJacketHalfShoulderKey] = finishMeasurements.jacketHalfShoulder;
        postBody[kFinishJacketLengthKey] = finishMeasurements.jacketLength;
        postBody[kFinishJacketSleeveWidthKey] = finishMeasurements.jacketSleeveWidth;
        postBody[kFinishPantSeatKey] = finishMeasurements.pantSeat;
        postBody[kFinishPantCrotchKey] = finishMeasurements.pantCrotch;
        postBody[kFinishPant1623BelowKey] = finishMeasurements.pant1623below;
        postBody[kFinishPantBottomCuffKey] = finishMeasurements.pantBottomCuff;
        postBody[kFinishPantOutseamKey] = finishMeasurements.pantOutseam;
        postBody[kFinishPantInseamKey] = finishMeasurements.pantInseam;
    }
    
    func setBodyMeasurementsForCustomer(_customerId : String, bodyMeasurements : BodyMeasurements, success : ((responseDict : Dictionary<String, AnyObject>) -> ()), failure : (NSError!) -> ()) {
        
        var postBody = Dictionary<String, String>();
        postBody[kBodyIdKey] = bodyMeasurements.measurementId
        postBody[kBodyChestKey] = bodyMeasurements.chest
        postBody[kBodyWaistKey] = bodyMeasurements.waist
        postBody[kBodyHipsKey] = bodyMeasurements.hips
        postBody[kBodyShouldersKey] = bodyMeasurements.shoulders
        postBody[kBodySeatKey] = bodyMeasurements.seat
        postBody[kBodyCrotchKey] = bodyMeasurements.crotch
        postBody[kBodyActualThighKey] = bodyMeasurements.actualThigh
        postBody[kBodyOutseamKey] = bodyMeasurements.outseam
        postBody[kBodyInseamKey] = bodyMeasurements.inseam
        postBody[kBodyShirtSleeveLengthKey] = bodyMeasurements.shirtSleeveLength
        postBody[kBodyJacketSleeveLengthKey] = bodyMeasurements.jacketSleeveLength
        postBody[kBodyShirtLengthKey] = bodyMeasurements.shirtLength
        postBody[kBodyWristKey] = bodyMeasurements.wrist
        postBody[kBodyNeckSizeKey] = bodyMeasurements.neckSize
        postBody[kBodyJacketLengthKey] = bodyMeasurements.jacketLength
        postBody[kBodyJacketWidthKey] = bodyMeasurements.jacketWidth
        postBody[kBodyBicepKey] = bodyMeasurements.bicep
        postBody[kBodyArmHoleKey] = bodyMeasurements.armHole
        postBody[kBodyBellyKey] = bodyMeasurements.belly
        
        
    }
    
}
