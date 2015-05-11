//
//  OrderItemInterface.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 5/11/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import Foundation

enum OrderItemType : String {
    case Shirt = "Shirt"
    case Pants = "Pants"
    case Vest = "Vest"
    case Jacket = "Jacket"
}

protocol OrderItemInterface {
    var itemType : OrderItemType {get set};
    var fabric : String {get set};
}