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
        case Other = "Other"
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
        case Other = "Other"
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
    enum MonogramPattern : String {
        case Eleven = "11"
        case Twelve = "12"
        case Twenty = "20"
        case TwentyOne = "21"
        case TwentyTwo = "22"
        case TwentyThree = "23"
        case ThirtyEight = "38"
        case ThirtyNine = "39"
        case Fourty = "40"
        case None = "No Monogram"
    }
    
    enum Fusing : String {
        case None = "No Fusing"
        case LightFusing = "Light Fusing"
        case RegularFusing = "Regular Fusing"
        case DoubleFusing = "Double Fusing"
        case TripleFusing = "Triple Fusing"
    }
    
    var itemType = OrderItemType.Shirt;
    var frontCollarLength : String! = "";
    var backCollarLength : String! = "";
    var buttonOnPlacket : Bool = false;
    var convertibleCuff : Bool = false;
    var hasMonogram : Bool = true;
    var monogram : String! = "";
    var monogramColor : String! = "";
    var monogramPlacement : String! = "";
    var fabric : String = "";
    var notes : String! = "";
    
    var collar : Collar! = .ClosePoint;
    var stavs : Stavs! = .Detachable;
    var shortSleeves : ShortSleeve! = .None;
    var pockets : Pockets! = .NoPockets;
    var cuffs : Cuffs! = .C1;
    var shirtFront : ShirtFront! = .Placket;
    var shirtBack : ShirtBack! = .Plain;
    var monogramPattern : MonogramPattern! = .None;
    var collarFusing : Fusing! = .None;
    var cuffFusing : Fusing! = .None;
    
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
        
        if (self.hasMonogram) {
            myString += "Monogram Pattern: \(self.monogramPattern.rawValue) \n"
            if (self.monogram.characters.count > 0) {
                myString += "Monogram: \(self.monogram) \n";
            }
            if (self.monogramColor.characters.count > 0) {
                myString += "Monogram Color: \(self.monogramColor) \n";
            }
            if (self.monogramPlacement.characters.count > 0) {
                myString += "Monogram Placement: \(self.monogramPlacement) \n";
            }
        }
        myString += "Collar: \(self.collar.rawValue) \n";
        myString += "Collar Fusing: \(self.collarFusing.rawValue)";
        myString += "Stavs: \(self.stavs.rawValue) \n";
        if (self.shortSleeves != ShortSleeve.None) {
            myString += "Short Sleeves: \(self.shortSleeves.rawValue) \n";
        }
        myString += "Pockets: \(self.pockets.rawValue) \n";
        myString += "Cuffs: \(self.cuffs.rawValue) \n";
        myString += "Cuff Fusing: \(self.cuffFusing.rawValue)";
        myString += "Shirt Front: \(self.shirtFront.rawValue) \n";
        myString += "Shirt Back: \(self.shirtBack.rawValue) \n";
        
        if (self.notes.characters.count > 0) {
            myString += "Notes: \(self.notes) \n";
        }
        
        if self.finishMeasurements != nil {
            myString += "Finish Measurements:\n";
            myString += self.finishMeasurements!.convertToMailingString();
        }
        
        
        
        return myString;
    }
}
