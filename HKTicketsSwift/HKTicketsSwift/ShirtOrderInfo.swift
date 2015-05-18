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
    
    var bodyMeasurements : BodyMeasurements?;
    var finishMeasurements : ShirtFinishMeasurements?;
    
    func convertToMailingString() -> String {
        var myString = "";
        myString += "Item: \(self.itemType.rawValue) \n";
        myString += "Fabric: \(self.fabric) \n";
        myString += "Front Collar Length: \(self.frontCollarLength) \n";
        myString += "Back Collar Length: \(self.backCollarLength) \n";
        
        myString += buttonOnPlacket == true ? "Button on Placket: Yes \n" : "Button on Placket: No \n";

        myString += convertibleCuff == true ? "Convertible Cuff: Yes \n" : "Convertible Cuff: No \n";
        
        if (count(self.monogram) > 0) {
            myString += "Monogram: \(self.monogram) \n";
        }
        if (count(self.monogramColor) > 0) {
            myString += "Monogram Color: \(self.monogramColor) \n";
        }
        
        myString += "Collar: \(self.collar.rawValue) \n";
        myString += "Stavs: \(self.stavs.rawValue) \n";
        if (self.shortSleeves != ShortSleeve.None) {
            myString += "Short Sleeves: \(self.shortSleeves.rawValue) \n";
        }
        myString += "Pockets: \(self.pockets.rawValue) \n";
        myString += "Cuffs: \(self.cuffs.rawValue) \n";
        myString += "Shirt Front: \(self.shirtFront.rawValue) \n";
        myString += "Shirt Back: \(self.shirtBack.rawValue) \n";
        
        if let body = self.bodyMeasurements {
            myString += self.bodyMeasurements!.convertToMailingString();
        }
        if let finish = self.finishMeasurements {
            myString += self.finishMeasurements!.convertToMailingString();
        }
        
        myString += "Notes: \(self.notes) \n";
        
        return myString;
    }
}
