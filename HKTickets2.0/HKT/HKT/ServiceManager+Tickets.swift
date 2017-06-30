//
//  ServiceManager+Tickets.swift
//  HKT
//
//  Created by Jay Park on 6/28/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import Foundation

extension ServiceManager {
    @discardableResult func searchForTickets(ticketId:String?, firstName:String?, lastName:String?, phone:String?, email:String?, status:String?, orderId:String?, success: (([TicketModel]) -> Swift.Void)?, failure: ((URLSessionDataTask?, Error) -> Swift.Void)?) -> URLSessionDataTask? {
        var searchParams = Dictionary<String, String>()
        if ticketId != nil && !ticketId!.isEmpty {
            searchParams[TicketModel.JSONPropertyKey.id.rawValue] = ticketId
        }
        if status != nil && !status!.isEmpty {
            searchParams[TicketModel.JSONPropertyKey.status.rawValue] = status
        }
        if firstName != nil && !firstName!.isEmpty {
            searchParams[CustomerModel.JSONPropertyKey.FirstName.rawValue] = status
        }
        if lastName != nil && !lastName!.isEmpty {
            searchParams[CustomerModel.JSONPropertyKey.LastName.rawValue] = lastName
        }
        if phone != nil && !phone!.isEmpty {
            searchParams[CustomerModel.JSONPropertyKey.Phone.rawValue] = phone
        }
        if email != nil && !email!.isEmpty {
            searchParams[CustomerModel.JSONPropertyKey.Email.rawValue] = email
        }
        if orderId != nil && !orderId!.isEmpty {
            searchParams[TicketModel.JSONPropertyKey.orderId.rawValue] = orderId
        }
        
        return self.get(ServiceRouter.tickets.path, parameters: searchParams, progress: nil, success: { (task, response) in
            guard let responseDict = response as? [Dictionary<String, AnyObject>] else {
                if let failure = failure {
                    failure(task, NSError())
                }
                return
            }
            
            let parsedTicketModels = TicketModel.ticketsWithArrayOfDictionaries(responseDict)
            if let success = success {
                success(parsedTicketModels)
            }
        }, failure: { (task, error) in
            if let failure = failure {
                failure(task, error)
            }
        })
    }
}
