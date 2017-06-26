//
//  ServiceManager+Customers.swift
//  HKT
//
//  Created by Jay Park on 6/25/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import Foundation
import AFNetworking

extension ServiceManager {
    @discardableResult func searchForCustomers(firstName:String?, middleName:String?, lastName:String?, address:String?, city:String?, state:String?, zip:String?, phone:String?, email:String?, success: (([CustomerModel]) -> Swift.Void)?, failure: ((URLSessionDataTask?, Error) -> Swift.Void)?) -> URLSessionDataTask? {
        
        var searchParams = Dictionary<String,String>()
        if firstName != nil && !firstName!.isEmpty {
            searchParams[CustomerModel.JSONPropertyKey.FirstName.rawValue] = firstName
        }
        if middleName != nil && !middleName!.isEmpty {
            searchParams[CustomerModel.JSONPropertyKey.MiddleName.rawValue] = middleName
        }
        if lastName != nil && !lastName!.isEmpty {
            searchParams[CustomerModel.JSONPropertyKey.LastName.rawValue] = lastName
        }
        if address != nil && !address!.isEmpty {
            searchParams[CustomerModel.JSONPropertyKey.Address.rawValue] = address
        }
        if city != nil && !city!.isEmpty {
            searchParams[CustomerModel.JSONPropertyKey.City.rawValue] = city
        }
        if state != nil && !state!.isEmpty {
            searchParams[CustomerModel.JSONPropertyKey.State.rawValue] = state
        }
        if zip != nil && !zip!.isEmpty {
            searchParams[CustomerModel.JSONPropertyKey.Zip.rawValue] = zip
        }
        if phone != nil && !phone!.isEmpty {
            searchParams[CustomerModel.JSONPropertyKey.Phone.rawValue] = phone
        }
        if email != nil && !email!.isEmpty {
            searchParams[CustomerModel.JSONPropertyKey.Email.rawValue] = email
        }

        return self.get(ServiceRouter.customers.path, parameters: searchParams, progress: nil, success: { (task, response) in
            guard let responseDict = response as? [Dictionary<String, AnyObject>] else {
                if let failure = failure {
                    failure(task, NSError())
                }
                return
            }
            
            let parsedCustomerModels = CustomerModel.customersWithArrayOfDictionaries(responseDict)
            if let success = success {
                success(parsedCustomerModels)
            }
        }) { (task, error) in
            if let failure = failure {
                failure(task, error)
            }
        }
    }
}
