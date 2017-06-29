//
//  CustomerModel.swift
//  HKT
//
//  Created by Jay Park on 6/14/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import Foundation

struct CustomerModel{
    var title = "";
    var firstName = "";
    var lastName = ""
    var middleName = ""
    var phone = "";
    var email = "";
    var address = "";
    var address2 = "";
    var city = "";
    var state = "";
    var zip = -1;
    var customerId = -1;
    
    enum JSONPropertyKey : String {
        case Title = "title";
        case FirstName = "first_name"
        case LastName = "last_name"
        case MiddleName = "middle_name"
        case Phone = "phone"
        case Email = "email"
        case Address = "address"
        case Address2 = "address2"
        case City = "city"
        case State = "state"
        case Zip = "zip"
        case CustomerId = "id"
    }
    
    init() {
    }
    
    init(jsonDictionary:Dictionary<String, AnyObject>) {
        if let title = jsonDictionary[JSONPropertyKey.Title.rawValue] as? String {
            self.title = title
        }
        if let firstName = jsonDictionary[JSONPropertyKey.FirstName.rawValue] as? String {
            self.firstName = firstName
        }
        if let lastName = jsonDictionary[JSONPropertyKey.LastName.rawValue] as? String {
            self.lastName = lastName
        }
        if let middleName = jsonDictionary[JSONPropertyKey.MiddleName.rawValue] as? String {
            self.middleName = middleName
        }
        if let phone = jsonDictionary[JSONPropertyKey.Phone.rawValue] as? String {
            self.phone = phone
        }
        if let email = jsonDictionary[JSONPropertyKey.Email.rawValue] as? String {
            self.email = email
        }
        if let address = jsonDictionary[JSONPropertyKey.Address.rawValue] as? String {
            self.address = address
        }
        if let address2 = jsonDictionary[JSONPropertyKey.Address2.rawValue] as? String {
            self.address2 = address2
        }
        if let city = jsonDictionary[JSONPropertyKey.City.rawValue] as? String {
            self.city = city
        }
        if let state = jsonDictionary[JSONPropertyKey.State.rawValue] as? String {
            self.state = state
        }
        if let zip = jsonDictionary[JSONPropertyKey.Zip.rawValue] as? Int {
            self.zip = zip
        }
        if let customerId = jsonDictionary[JSONPropertyKey.CustomerId.rawValue] as? Int {
            self.customerId = customerId
        }
    }
    
    static func customersWithArrayOfDictionaries(_ jsonArray : Array<Dictionary<String, AnyObject>>) -> [CustomerModel] {

        var parsedCustomerArray : [CustomerModel] = [];
        
        for customerDictionary : Dictionary<String, AnyObject> in jsonArray {
            var customer = CustomerModel(jsonDictionary: customerDictionary);
            parsedCustomerArray.append(customer);
        }
        return parsedCustomerArray;
    }
}
