//
//  Customer.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 7/21/15.
//  Copyright © 2015 JPApps. All rights reserved.
//

import UIKit

class Customer: NSObject {
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
    
    enum CustomerPropertyKey : String {
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
    
    static func customersWithArrayOfDictionaries(_customerArray : Array<Dictionary<String, AnyObject>>) -> [Customer] {
        
        var customerArray : [Customer] = [];
        
        for customerDictionary : Dictionary<String, AnyObject> in _customerArray {
            let customer = Customer();
            if let title = customerDictionary[CustomerPropertyKey.Title.rawValue] {
                customer.title = title as! String;
            }
            if let firstName = customerDictionary[CustomerPropertyKey.FirstName.rawValue] {
                customer.firstName = firstName as! String;
            }
            if let lastName = customerDictionary[CustomerPropertyKey.LastName.rawValue] {
                customer.lastName = lastName as! String;
            }
            if let middleName = customerDictionary[CustomerPropertyKey.MiddleName.rawValue] {
                customer.middleName = middleName as! String;
            }
            if let phone = customerDictionary[CustomerPropertyKey.Phone.rawValue] {
                customer.phone = phone as! String;
            }
            if let email = customerDictionary[CustomerPropertyKey.Email.rawValue] {
                customer.email = email as! String;
            }
            if let address = customerDictionary[CustomerPropertyKey.Address.rawValue] {
                customer.address = address as! String;
            }
            if let address2 = customerDictionary[CustomerPropertyKey.Address2.rawValue] {
                customer.address2 = address2 as! String;
            }
            if let city = customerDictionary[CustomerPropertyKey.City.rawValue] {
                customer.city = city as! String;
            }
            if let state = customerDictionary[CustomerPropertyKey.State.rawValue] {
                customer.state = state as! String;
            }
            if let zip = customerDictionary[CustomerPropertyKey.Zip.rawValue] {
                customer.zip = zip as! NSInteger;
            }
            if let customerId = customerDictionary[CustomerPropertyKey.CustomerId.rawValue] {
                customer.customerId = customerId as! NSInteger;
            }
            customerArray.append(customer);
        }
        return customerArray;
    }
}
