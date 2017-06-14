//
//  TicketModel.swift
//  HKT
//
//  Created by Jay Park on 5/21/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import Foundation

struct TicketModel {
    var fname:String = ""
    var lname:String = ""
    
    //sample for json parsing
    static func parseModelsFromJsonArray(jsonArray:[[String:Any]]) -> [TicketModel] {
        var ticketModels:[TicketModel] = []
        
        for jsonDict in jsonArray {
            var ticket:TicketModel = TicketModel()
            ticket.fname = jsonDict["fname"] as? String ?? ""
            ticket.lname = jsonDict["lname"] as? String ?? ""
            ticketModels.append(ticket)
        }
        
        return ticketModels
    }
}


