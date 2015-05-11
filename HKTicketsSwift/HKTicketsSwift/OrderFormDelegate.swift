//
//  OrderFormDelegate.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 5/11/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import Foundation

protocol OrderFormDelegate {
    func didFinishCustomizing(items: [OrderItemInterface]);
    
    func didFinishCustomizingShirts(items: [ShirtOrderInfo]);
}