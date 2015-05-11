//
//  ShirtOrderInfo.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 5/10/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit

class ShirtOrderInfo: NSObject, OrderItemInterface {
    enum Collar : String {
        case ClosePoint = "#37"
        case MediumSpread = "#40"
        case WideSpread = "#41"
        case ButtonDown = "#47"
        case HiddenButtonDown = "#47-HBD"
        case Tab = "#56"
        case EyeLets = "#58"
    };
    enum Stavs : String {
        case Detachable = "Detachable Stavs"
        case Permenant = "Permenant Stavs"
    }
    enum ShortSleeve : String {
        case S1 = "S1"
        case S2 = "S2"
        case S4 = "S4"
        case S5 = "S5"
        case None = "N/A"
    }
    enum Pockets : String {
        case P2 = "P2"
        case P3 = "P3"
        case P6 = "P6"
        case P10 = "P10"
        case NoPockets = "No Pockets"
    }
    enum Cuffs : String {
        case C1 = "C1"
        case C2 = "C2"
        case C3 = "C3"
        case C4 = "C4"
        case C5 = "C5"
        case C6 = "C6"
        case C9 = "C9"
        case C10 = "C10"
    }
    enum ShirtFront : String {
        case Placket = "Placket Front"
        case Plain = "Plain Front"
        case HiddenButton = "Hidden Button Front"
    }
    enum ShirtBack : String {
        case Plain = "Plain Back"
        case PlainWithDart = "Plain Back w/ Dart"
        case BoxPleat = "Box Pleat"
        case SinglePleat = "Single Pleat"
    }
    
    var itemType = OrderItemType.Shirt;
    var oldOrderNumber : String! = "";
    var newOrderNumber : String! = "";
    var frontCollarLength : String! = "";
    var backCollarLength : String! = "";
    var buttonOnPlacket : Bool = false;
    var convertibleCuff : Bool = false;
    var monogram : String! = "";
    var monogramColor : String! = "";
    var fabric : String = "";
    var notes : String! = "";
    
    var collar : Collar! = .ClosePoint;
    var stavs : Stavs! = .Detachable;
    var shortSleeves : ShortSleeve! = .None;
    var pockets : Pockets! = .NoPockets;
    var cuffs : Cuffs! = .C1;
    var shirtFront : ShirtFront! = .Placket;
    var shirtBack : ShirtBack! = .Plain;
    
}
