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
    
    fileprivate enum JSONPropertyKey : String {
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
    
    static func customersWithArrayOfDictionaries(_customerArray : Array<Dictionary<String, AnyObject>>) -> [CustomerModel] {

        var customerArray : [CustomerModel] = [];
        
        for customerDictionary : Dictionary<String, AnyObject> in _customerArray {
            var customer = CustomerModel();
            if let title = customerDictionary[JSONPropertyKey.Title.rawValue] {
                customer.title = title as! String;
            }
            if let firstName = customerDictionary[JSONPropertyKey.FirstName.rawValue] {
                customer.firstName = firstName as! String;
            }
            if let lastName = customerDictionary[JSONPropertyKey.LastName.rawValue] {
                customer.lastName = lastName as! String;
            }
            if let middleName = customerDictionary[JSONPropertyKey.MiddleName.rawValue] {
                customer.middleName = middleName as! String;
            }
            if let phone = customerDictionary[JSONPropertyKey.Phone.rawValue] {
                customer.phone = phone as! String;
            }
            if let email = customerDictionary[JSONPropertyKey.Email.rawValue] {
                customer.email = email as! String;
            }
            if let address = customerDictionary[JSONPropertyKey.Address.rawValue] {
                customer.address = address as! String;
            }
            if let address2 = customerDictionary[JSONPropertyKey.Address2.rawValue] {
                customer.address2 = address2 as! String;
            }
            if let city = customerDictionary[JSONPropertyKey.City.rawValue] {
                customer.city = city as! String;
            }
            if let state = customerDictionary[JSONPropertyKey.State.rawValue] {
                customer.state = state as! String;
            }
            if let zip = customerDictionary[JSONPropertyKey.Zip.rawValue] {
                customer.zip = zip as! NSInteger;
            }
            if let customerId = customerDictionary[JSONPropertyKey.CustomerId.rawValue] {
                customer.customerId = customerId as! NSInteger;
            }
            customerArray.append(customer);
        }
        return customerArray;
    }
}
