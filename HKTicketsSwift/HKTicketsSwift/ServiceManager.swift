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
}
