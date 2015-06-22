//
//  JacketOrderInfo.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 6/3/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit

class JacketOrderInfo: NSObject, OrderItemInterface {
    enum Lapel : String {
        case Notch = "Notch"
        case Peak = "Peak"
        case Shawl = "Shawl"
        case Other = "Other"
    }
    enum Lining : String {
        case Full = "Full Lined"
        case Quarter = "Quarter Lined"
        case Unconstructed = "Unconstructed"
    }
    enum Padding : String {
        case Light = "Light"
        case Medium = "Medium"
        case Heavy = "Heavy"
        case NotApplicable = "N/A"
    }
    
    enum Buttons : String {
        case Single  = "Single Button"
        case Two = "Two Button"
        case Three = "Three Button"
        case DoubleBreasted = "Double Breasted"
    }
    
    enum Pockets : String {
        case Regular  = "Regular Pockets"
        case Slanted = "Slanted Pockets"
    }
    
    enum Vent : String {
        case None  = "No Vent"
        case Center = "Center Vent"
        case Side = "Side Vent"
    }
    
    enum Stitch : String {
        case None = "No Sititching on the front"
        case Hand = "Hand Edge Stitching"
        case QuarterMachine = "1/4\" Machine Stitch"
    }
    
    enum Cuffs : String {
        case ButtonholeReady = "Buttonhole Ready"
        case Functional = "Functional Buttons"
    }
    
    var lapel : Lapel = Lapel.Other;
    var lapelWidth : String = "";
    var lining : Lining = Lining.Full;
    var padding : Padding = Padding.Light;
    var buttons : Buttons = Buttons.Single;
    var firstButtonPosition : String = "";
    var pockets : Pockets = Pockets.Regular;
    var vent : Vent = Vent.None;
    var stitch : Stitch = Stitch.None;
    var cuffs : Cuffs = Cuffs.Functional;
    var ticketPocket : Bool  = false;
    var flapWidth : String = "";
    var buttonHoleOnLapel : Bool = false;
    
    var itemType = OrderItemType.Jacket;
    var fabric : String = ""
    var notes : String = ""
    
    var bodyMeasurements : BodyMeasurements?;
    var finishMeasurements : JacketFinishMeasurements?;
    
    func convertToMailingString() -> String {
        var myString = "";
        myString += "Item Type: \(self.itemType.rawValue)\n";
        myString += "Fabric: \(self.fabric)\n"
        myString += "Lapel: \(self.lapel.rawValue)\n";
        myString += "Lining: \(self.lining.rawValue)\n";
        myString += "Padding: \(self.padding.rawValue)\n";
        myString += "Buttons: \(self.buttons.rawValue)\n";
        myString += "Pockets: \(self.pockets.rawValue)\n";
        myString += "Vent: \(self.vent.rawValue)\n";
        myString += "Stitch: \(self.stitch.rawValue)\n";
        myString += "Cuffs: \(self.cuffs.rawValue)\n";
        myString += self.ticketPocket == true ? "Ticket Pocket: Yes \n" : "Ticket Pocket: No \n";
        if (self.flapWidth.characters.count > 0) {
            myString += "Flap Width: \(self.flapWidth)\n";
        }
        myString += self.buttonHoleOnLapel == true ? "Button Hole On Lapel: Yes \n" : "Button Hole On Lapel: No \n";
        if (self.notes.characters.count > 0) {
            myString += "Notes: \(self.notes)\n";
        }
        
        if let finish = self.finishMeasurements {
            myString += "Finish Measurements:\n";
            myString += finish.convertToMailingString();
        }
        
        return myString;
    }
    
   
}
