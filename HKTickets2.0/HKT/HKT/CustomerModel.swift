//
//  CustomerModel.swift
//  HKT
//
//  Created by Jay Park on 6/14/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import Foundation

struct CustomerModel {
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
    
    static func customersWithArrayOfDictionaries(_ customerArray : Array<Dictionary<String, AnyObject>>) -> [CustomerModel] {

        var parsedCustomerArray : [CustomerModel] = [];
        
        for customerDictionary : Dictionary<String, AnyObject> in customerArray {
            var customer = CustomerModel();

            if let title = customerDictionary[JSONPropertyKey.Title.rawValue] as? String {
                customer.title = title
            }
            if let firstName = customerDictionary[JSONPropertyKey.FirstName.rawValue] as? String {
                customer.firstName = firstName
            }
            if let lastName = customerDictionary[JSONPropertyKey.LastName.rawValue] as? String {
                customer.lastName = lastName
            }
            if let middleName = customerDictionary[JSONPropertyKey.MiddleName.rawValue] as? String {
                customer.middleName = middleName
            }
            if let phone = customerDictionary[JSONPropertyKey.Phone.rawValue] as? String {
                customer.phone = phone
            }
            if let email = customerDictionary[JSONPropertyKey.Email.rawValue] as? String {
                customer.email = email
            }
            if let address = customerDictionary[JSONPropertyKey.Address.rawValue] as? String {
                customer.address = address
            }
            if let address2 = customerDictionary[JSONPropertyKey.Address2.rawValue] as? String {
                customer.address2 = address2
            }
            if let city = customerDictionary[JSONPropertyKey.City.rawValue] as? String {
                customer.city = city
            }
            if let state = customerDictionary[JSONPropertyKey.State.rawValue] as? String {
                customer.state = state
            }
            if let zip = customerDictionary[JSONPropertyKey.Zip.rawValue] as? Int {
                customer.zip = zip
            }
            if let customerId = customerDictionary[JSONPropertyKey.CustomerId.rawValue] as? Int {
                customer.customerId = customerId
            }
            parsedCustomerArray.append(customer);
        }
        return parsedCustomerArray;
    }
}
