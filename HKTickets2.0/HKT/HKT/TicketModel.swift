//
//  TicketModel.swift
//  HKT
//
//  Created by Jay Park on 5/21/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import Foundation

struct TicketModel {
    var id:Int = -1
    var status = ""
    var lastModifiedTimestamp:Date?
    var dateIn:Date?
    var dateReady:Date?
    var comments = ""
    var totalPrice = 0.0
    var pickedUp = ""
    var deposit = 0.0
    var tailorName = ""
    var nameTitle = ""
    var orderId = ""
    var completedDate:Date?
    var createdUser = ""
    var lastModifiedUser = ""
    var customerId = -1
    
    init() {
    }
    
    enum JSONPropertyKey:String {
        case id = "ticket_id"
        case status = "status"
        case lastModifiedTimestamp = "last_modified_timestamp"
        case dateIn = "date_in"
        case dateReady = "date_ready"
        case comments = "comments"
        case totalPrice = "total_price"
        case pickedUp = "picked_up"
        case deposit = "deposit"
        case tailorName = "tailor_name"
        case nameTitle = "name_title"
        case orderId = "order_id"
        case completedDate = "completed_date"
        case createdUser = "createdUser"
        case lastModifiedUser = "lastModifiedUser"
        case customerId = "customerId"
    }
    
    //TODO customer reference
    //TODO ticket alteration array
    
    init(jsonDictionary:Dictionary<String, AnyObject>) {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //dates are stored on the server in EST, so we need force the time correction here
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        if let id = jsonDictionary[JSONPropertyKey.id.rawValue] as? Int {
            self.id = id
        }
        if let status = jsonDictionary[JSONPropertyKey.status.rawValue] as? String {
            self.status = status
        }
        if let lastModifiedTimestampString = jsonDictionary[JSONPropertyKey.lastModifiedTimestamp.rawValue] as? String {
            self.lastModifiedTimestamp = dateFormatter.date(from: lastModifiedTimestampString)
            
        }
        if let dateInString = jsonDictionary[JSONPropertyKey.dateIn.rawValue] as? String {
            self.dateIn = dateFormatter.date(from: dateInString)
        }
        if let dateReadyString = jsonDictionary[JSONPropertyKey.dateReady.rawValue] as? String {
            self.dateReady = dateFormatter.date(from: dateReadyString)
        }
        if let comments = jsonDictionary[JSONPropertyKey.comments.rawValue] as? String {
            self.comments = comments
        }
        if let totalPrice = jsonDictionary[JSONPropertyKey.totalPrice.rawValue] as? Double {
            self.totalPrice = totalPrice
        }
        if let pickedUp = jsonDictionary[JSONPropertyKey.pickedUp.rawValue] as? String {
            self.pickedUp = pickedUp
        }
        if let deposit = jsonDictionary[JSONPropertyKey.deposit.rawValue] as? Double {
            self.deposit = deposit
        }
        if let tailorName = jsonDictionary[JSONPropertyKey.tailorName.rawValue] as? String {
            self.tailorName = tailorName
        }
        if let nameTitle = jsonDictionary[JSONPropertyKey.nameTitle.rawValue] as? String {
            self.nameTitle = nameTitle
        }
        if let orderId = jsonDictionary[JSONPropertyKey.orderId.rawValue] as? String {
            self.orderId = orderId
        }
        if let completedDateString = jsonDictionary[JSONPropertyKey.completedDate.rawValue] as? String {
            self.completedDate = dateFormatter.date(from: completedDateString)
        }
        if let createdUser = jsonDictionary[JSONPropertyKey.createdUser.rawValue] as? String {
            self.createdUser = createdUser
        }
        if let lastModifiedUser = jsonDictionary[JSONPropertyKey.lastModifiedUser.rawValue] as? String {
            self.lastModifiedUser = lastModifiedUser
        }
        if let customerId = jsonDictionary[JSONPropertyKey.customerId.rawValue] as? Int {
            self.customerId = customerId
        }
    }
    
    static func ticketsWithArrayOfDictionaries(_ jsonArray:Array<Dictionary<String, AnyObject>>) -> [TicketModel] {
        var ticketModels:[TicketModel] = []
        
        for jsonDict in jsonArray {
            let ticket:TicketModel = TicketModel(jsonDictionary:jsonDict)
            ticketModels.append(ticket)
        }
        
        return ticketModels
    }
}


