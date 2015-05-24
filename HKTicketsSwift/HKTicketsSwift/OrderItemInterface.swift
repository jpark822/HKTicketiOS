//
//  OrderItemInterface.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 5/11/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import Foundation

enum OrderItemType : String {
    case Shirt = "Custom Shirt"
    case Pants = "Custom Pants"
    case Vest = "Custom Vest"
    case Jacket = "Custom Jacket"
}

protocol OrderItemInterface {
    var itemType : OrderItemType {get set};
    var fabric : String {get set};
    
    func convertToMailingString() -> String;
}