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
    
    //common keys
    let kMeasurementTypeKey = "type"
    let kMeasurementBodyTypeKey = "body"
    let kMeasurementFinishTypeKey = "finish"
    let kValueKey = "value"
    let kCustomerIdKey = "customerId";
    
    //MARK: finish measurement keys
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
    
    //MARK: body measurement keys
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
    
    //MARK: route endpoints
    let kMeasurementEndpoint = "Measurements";
    let kCustomersEndpoint = "Customers";
    
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
    
    //MARK: TODO this is fake remove this
    func getBodyMeasurementsByCustomerId(_customerId : Int, success : ((BodyMeasurements) -> ()), failure : (NSError!) -> ()) {
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
    //MARK: TODO this is fake remove this
    func getFinishMeasurementsByCustomerId(_customerId : Int, success : (([FinishMeasurements]) -> ()), failure : (NSError!) -> ()) {
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
        finish.measurementId = "164236";
        
        let finish2 = FinishMeasurements();
        finish2.chest = "11";
        finish2.waist = "21";
        finish2.waist = "31";
        finish2.hips = "41";
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
        finish2.measurementId = "2734654";
        
        success([finish, finish2]);
    }
    
    func postNewFinishMeasurementsForCustomer(_customerId : String, finishMeasurements : FinishMeasurements, success : ((responseDict : Dictionary<String, AnyObject>) -> ()), failure : (NSError!) -> ()) {
        var postBody = self.covertFinishMeasurementsToDictionary(finishMeasurements);
        postBody[kCustomerIdKey] = "\(_customerId)";
    }
    
    func getFinishMeasurementsForCustomer(_customerId : String, success : (([FinishMeasurements]) -> ()), failure : (NSError!) -> ()) {
        
        self.sessionManager .GET(kMeasurementEndpoint, parameters: [kCustomerIdKey : _customerId], success: { (dataTask : NSURLSessionDataTask!, response : AnyObject!) -> Void in
            let convertedMeasurements = self.convertRawArrayOfFinishMeasurementsToFinishMeasurements(response as! [Dictionary<String, AnyObject>])
            success(convertedMeasurements);
            
            }) { (dataTask : NSURLSessionDataTask!, error : NSError!) -> Void in
                
        }
    }
    
    func postBodyMeasurementsForCustomer(_customerId : Int, bodyMeasurements : BodyMeasurements, success : ((responseDict : Dictionary<String, AnyObject>) -> ()), failure : (NSError!) -> ()) {
        
        var postBody = Dictionary<String, AnyObject>();
        postBody[kValueKey] = self.covertBodyMeasurementsToDictionary(bodyMeasurements);
        postBody[kCustomerIdKey] = "\(_customerId)";
        postBody[kMeasurementTypeKey] = kMeasurementBodyTypeKey
        

        self.sessionManager.POST("Measurements", parameters: postBody, success: { (dataTask : NSURLSessionDataTask!, response : AnyObject!) -> Void in
            success(responseDict: response as! Dictionary<String, AnyObject>);
            
            }) { (dataTask : NSURLSessionDataTask!, error : NSError!) -> Void in
                failure(error);
        }
    }
    
    //MARK: Utilities for converting measurements and request bodies
    func convertResponseToBodyMeasurements(_response : Dictionary<String, AnyObject>) -> BodyMeasurements {
        let body = BodyMeasurements();
        
        if let responseObject : AnyObject = _response["value"] {
            if let response = responseObject as? Dictionary<String, String> {
                body.chest = response[kBodyChestKey] ?? "";
                body.waist = response[kBodyWaistKey] ?? "";
                body.hips = response[kBodyHipsKey] ?? "";
                body.shoulders = response[kBodyShouldersKey] ?? "";
                body.seat = response[kBodySeatKey] ?? "";
                body.crotch = response[kBodyCrotchKey] ?? "";
                body.actualThigh = response[kBodyActualThighKey] ?? "";
                body.outseam = response[kBodyOutseamKey] ?? "";
                body.inseam = response[kBodyInseamKey] ?? "";
                body.shirtSleeveLength = response[kBodyShirtSleeveLengthKey] ?? "";
                body.jacketSleeveLength = response[kBodyJacketSleeveLengthKey] ?? "";
                body.shirtLength = response[kBodyShirtLengthKey] ?? "";
                body.wrist = response[kBodyWristKey] ?? "";
                body.neckSize = response[kBodyNeckSizeKey] ?? "";
                body.jacketLength = response[kBodyJacketLengthKey] ?? "";
                body.jacketWidth = response[kBodyJacketWidthKey] ?? "";
                body.bicep = response[kBodyBicepKey] ?? "";
                body.armHole = response[kBodyArmHoleKey] ?? "";
                body.belly = response[kBodyBellyKey] ?? "";
            }
        }
        return body;
    }
    
    func covertBodyMeasurementsToDictionary(bodyMeasurements : BodyMeasurements) -> Dictionary<String, String> {
        var dictionary : Dictionary<String, String> = Dictionary<String, String>();
        dictionary[kBodyChestKey] = bodyMeasurements.chest
        dictionary[kBodyWaistKey] = bodyMeasurements.waist
        dictionary[kBodyHipsKey] = bodyMeasurements.hips
        dictionary[kBodyShouldersKey] = bodyMeasurements.shoulders
        dictionary[kBodySeatKey] = bodyMeasurements.seat
        dictionary[kBodyCrotchKey] = bodyMeasurements.crotch
        dictionary[kBodyActualThighKey] = bodyMeasurements.actualThigh
        dictionary[kBodyOutseamKey] = bodyMeasurements.outseam
        dictionary[kBodyInseamKey] = bodyMeasurements.inseam
        dictionary[kBodyShirtSleeveLengthKey] = bodyMeasurements.shirtSleeveLength
        dictionary[kBodyJacketSleeveLengthKey] = bodyMeasurements.jacketSleeveLength
        dictionary[kBodyShirtLengthKey] = bodyMeasurements.shirtLength
        dictionary[kBodyWristKey] = bodyMeasurements.wrist
        dictionary[kBodyNeckSizeKey] = bodyMeasurements.neckSize
        dictionary[kBodyJacketLengthKey] = bodyMeasurements.jacketLength
        dictionary[kBodyJacketWidthKey] = bodyMeasurements.jacketWidth
        dictionary[kBodyBicepKey] = bodyMeasurements.bicep
        dictionary[kBodyArmHoleKey] = bodyMeasurements.armHole
        dictionary[kBodyBellyKey] = bodyMeasurements.belly
        
        return dictionary;
    }
    
    func covertFinishMeasurementsToDictionary(finishMeasurements : FinishMeasurements) -> Dictionary<String, String> {
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
        
        return postBody;
    }
    
    func convertRawArrayOfFinishMeasurementsToFinishMeasurements(_response : [Dictionary<String, AnyObject>]) -> [FinishMeasurements] {
        var finishMeasurements : [FinishMeasurements] = [];
        
        for rawMeasurementDict : Dictionary<String, AnyObject> in _response {
            if let measurementString = rawMeasurementDict["value"] as? String {
                let measurementDict = self.convertJsonStringIntoDictionary(measurementString);
                let finishMeasurement : FinishMeasurements = FinishMeasurements();
                finishMeasurement.chest = measurementDict[kFinishChestKey] as! String? ?? "";
                finishMeasurement.waist = measurementDict[kFinishChestKey] as! String? ?? "";
                finishMeasurement.hips = measurementDict[kFinishChestKey] as! String? ?? "";
                finishMeasurement.shoulders = measurementDict[kFinishChestKey] as! String? ?? "";
                finishMeasurement.shirtSleeveLength = measurementDict[kFinishChestKey] as! String? ?? "";
                finishMeasurement.shirtCuff = measurementDict[kFinishChestKey] as! String? ?? "";
                finishMeasurement.shirtNeck = measurementDict[kFinishChestKey] as! String? ?? "";
                finishMeasurement.shirtWidth6Below = measurementDict[kFinishChestKey] as! String? ?? "";
                finishMeasurement.shirtWidth12Below = measurementDict[kFinishChestKey] as! String? ?? "";
                finishMeasurement.vestBackLength = measurementDict[kFinishChestKey] as! String? ?? "";
                finishMeasurement.vestFrontLength = measurementDict[kFinishChestKey] as! String? ?? "";
                finishMeasurement.jacketSleeveLength = measurementDict[kFinishChestKey] as! String? ?? "";
                finishMeasurement.jacketHalfShoulder = measurementDict[kFinishChestKey] as! String? ?? "";
                finishMeasurement.jacketLength = measurementDict[kFinishChestKey] as! String? ?? "";
                finishMeasurement.jacketSleeveWidth = measurementDict[kFinishChestKey] as! String? ?? "";
                finishMeasurement.pantSeat = measurementDict[kFinishChestKey] as! String? ?? "";
                finishMeasurement.pantCrotch = measurementDict[kFinishChestKey] as! String? ?? "";
                finishMeasurement.pant1623below = measurementDict[kFinishChestKey] as! String? ?? "";
                finishMeasurement.pantBottomCuff = measurementDict[kFinishChestKey] as! String? ?? "";
                finishMeasurement.pantOutseam = measurementDict[kFinishChestKey] as! String? ?? "";
                finishMeasurement.pantInseam = measurementDict[kFinishChestKey] as! String? ?? "";
                
                finishMeasurements.append(finishMeasurement);
            }
        }
        
        return finishMeasurements;
    }
    
    func convertJsonStringIntoDictionary(jsonString : String) -> Dictionary<String, AnyObject> {
        let objectData = jsonString.dataUsingEncoding(NSUTF8StringEncoding);
        var convertedDictionary = Dictionary<String, AnyObject>();
        do {
            convertedDictionary = try NSJSONSerialization.JSONObjectWithData(objectData!, options: NSJSONReadingOptions.MutableContainers) as! Dictionary<String, AnyObject>;
        }
        catch _ {
            
        }
        
        return convertedDictionary;
    }
}
