//
//  TicketAlterationModel.swift
//  HKT
//
//  Created by Jay Park on 6/29/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import Foundation

struct TicketAlerationModel {
    var id = -1
    var ticketId = -1
    var quantity = 0
    var taxable = false
    var description = ""
    var price = 0.0
    var orderIndex = -1
    var type = 0
    var comment = ""
    
    fileprivate enum JSONPropertyKey:String {
        case id = "ticket_Alteration_id"
        case ticketId = "ticket_id"
        case quantity = "quantity"
        case taxable = "taxable"
        case description = "description"
        case price = "price"
        case orderIndex = "order_index"
        case type = "type"
        case comment = "comment"
    }
    
    init() {
    }
    
    init(jsonDictionary:Dictionary<String, AnyObject>) {
        if let id = jsonDictionary[JSONPropertyKey.id.rawValue] as? Int {
            self.id = id
        }
        if let ticketId = jsonDictionary[JSONPropertyKey.ticketId.rawValue] as? Int {
            self.ticketId = ticketId
        }
        if let quantity = jsonDictionary[JSONPropertyKey.quantity.rawValue] as? Int {
            self.quantity = quantity
        }
        if let taxable = jsonDictionary[JSONPropertyKey.id.rawValue] as? Bool {
            self.taxable = taxable
        }
        if let description = jsonDictionary[JSONPropertyKey.description.rawValue] as? String {
            self.description = description
        }
        if let price = jsonDictionary[JSONPropertyKey.price.rawValue] as? Double {
            self.price = price
        }
        if let orderIndex = jsonDictionary[JSONPropertyKey.orderIndex.rawValue] as? Int {
            self.orderIndex = orderIndex
        }
        if let type = jsonDictionary[JSONPropertyKey.type.rawValue] as? Int {
            self.type = type
        }
        if let comment = jsonDictionary[JSONPropertyKey.comment.rawValue] as? String {
            self.comment = comment
        }
    }
    
    static func ticketAlterationsWithArrayOfDictionaries(_ jsonArray : Array<Dictionary<String, AnyObject>>) -> [TicketAlerationModel] {
        var parsedAlterationArray = [TicketAlerationModel]()
        
        for alterationDictionary : Dictionary<String, AnyObject> in jsonArray {
            let alteration = TicketAlerationModel(jsonDictionary: alterationDictionary)
            parsedAlterationArray.append(alteration)
        }
        return parsedAlterationArray
    }
}
