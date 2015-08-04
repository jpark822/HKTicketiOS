//
//  OrderFormDelegate.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 5/11/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import Foundation

protocol OrderFormDelegate {
    //theres a bug with this. cant use until apple fixes
//    func didFinishCustomizing(items: [OrderItemInterface]);
//    func didFinishEditing(item: OrderItemInterface)
    
    func getCustomer() -> Customer;
    
    func getBodyMeasurements() -> BodyMeasurements;
    func getFinishMeasurements() -> [FinishMeasurements];
    
    func getInitialFinishMeasurements() -> FinishMeasurements;
    
    func didFinishCustomizingShirts(items: [ShirtOrderInfo]);
    func didFinishEditingShirt(shirt: ShirtOrderInfo);
    
    func didFinishCustomizingPants(items: [PantsOrderInfo]);
    func didFinishEditingPants(shirt: PantsOrderInfo);
    
    func didFinishCustomizingVests(items: [VestOrderInfo]);
    func didFinishEditingVest(vest: VestOrderInfo);
    
    func didFinishCustomizingJackets(items: [JacketOrderInfo]);
    func didFinishEditingJacket(vest: JacketOrderInfo);
    
    func didFinishCustomizingSuits(items: [SuitOrderInfo]);
    func didFinishEditingSuit(suit: SuitOrderInfo);
    
}