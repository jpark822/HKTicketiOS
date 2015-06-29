//
//  OrderOptionCell.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 5/17/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit

class OrderOptionCell: UICollectionViewCell {

    @IBOutlet weak var optionImage: UIImageView!
    @IBOutlet weak var optionLabel: UILabel!
    
    override var selected: Bool {
        didSet {
            if self.selected {
                self.layer.borderColor = UIColor.blackColor().CGColor;
                self.layer.borderWidth = 1;
            } else {
                self.layer.borderWidth = 0;
            }
        }
    }
    
    func configureCellWithOption(option : ShirtOrderInfo.Collar) {
        self.optionLabel.text = option.rawValue;
        
        switch option {
        case ShirtOrderInfo.Collar.ClosePoint:
            self.optionImage.image = UIImage(named: "collar_close_point");
        case ShirtOrderInfo.Collar.MediumSpread:
            self.optionImage.image = UIImage(named: "collar_medium_spread");
        case ShirtOrderInfo.Collar.WideSpread:
            self.optionImage.image = UIImage(named: "collar_wide_spread");
        case ShirtOrderInfo.Collar.ButtonDown:
            self.optionImage.image = UIImage(named: "collar_button_down");
        case ShirtOrderInfo.Collar.EyeLets:
            self.optionImage.image = UIImage(named: "collar_eyelets");
        case ShirtOrderInfo.Collar.HiddenButtonDown:
            self.optionImage.image = UIImage(named: "collar_hidden_button_down");
        case ShirtOrderInfo.Collar.Tab:
            self.optionImage.image = UIImage(named: "collar_tab");
        case ShirtOrderInfo.Collar.Other:
            self.optionImage.image = UIImage();
        }
    }
    
    func configureCellWithOption(option : ShirtOrderInfo.Pockets) {
        self.optionLabel.text = option.rawValue;
        
        switch option {
        case ShirtOrderInfo.Pockets.NoPockets:
            self.optionImage.image = UIImage();
        case ShirtOrderInfo.Pockets.P2:
            self.optionImage.image = UIImage(named: "pockets_p2");
        case ShirtOrderInfo.Pockets.P3:
            self.optionImage.image = UIImage(named: "pockets_p3");
        case ShirtOrderInfo.Pockets.P6:
            self.optionImage.image = UIImage(named: "pockets_p6");
        case ShirtOrderInfo.Pockets.P10:
            self.optionImage.image = UIImage(named: "pockets_p10");
        }
    }
    
    func configureCellWithOption(option : ShirtOrderInfo.ShortSleeve) {
        self.optionLabel.text = option.rawValue;
        
        switch option {
        case ShirtOrderInfo.ShortSleeve.None:
            self.optionImage.image = UIImage();
        case ShirtOrderInfo.ShortSleeve.S1:
            self.optionImage.image = UIImage(named: "short_sleeve_s1");
        case ShirtOrderInfo.ShortSleeve.S2:
            self.optionImage.image = UIImage(named: "short_sleeve_s2");
        case ShirtOrderInfo.ShortSleeve.S4:
            self.optionImage.image = UIImage(named: "short_sleeve_s4");
        case ShirtOrderInfo.ShortSleeve.S5:
            self.optionImage.image = UIImage(named: "short_sleeve_s5");
        }
    }
    
    func configureCellWithOption(option : ShirtOrderInfo.Cuffs) {
        self.optionLabel.text = option.rawValue;
        
        switch option {
        case ShirtOrderInfo.Cuffs.Other:
            self.optionImage.image = UIImage();
        case ShirtOrderInfo.Cuffs.C1:
            self.optionImage.image = UIImage(named: "cuffs_c1");
        case ShirtOrderInfo.Cuffs.C2:
            self.optionImage.image = UIImage(named: "cuffs_c2");
        case ShirtOrderInfo.Cuffs.C3:
            self.optionImage.image = UIImage(named: "cuffs_c3");
        case ShirtOrderInfo.Cuffs.C4:
            self.optionImage.image = UIImage(named: "cuffs_c4");
        case ShirtOrderInfo.Cuffs.C5:
            self.optionImage.image = UIImage(named: "cuffs_c5");
        case ShirtOrderInfo.Cuffs.C6:
            self.optionImage.image = UIImage(named: "cuffs_c6");
        case ShirtOrderInfo.Cuffs.C9:
            self.optionImage.image = UIImage(named: "cuffs_c9");
        case ShirtOrderInfo.Cuffs.C10:
            self.optionImage.image = UIImage(named: "cuffs_c10");
        }
    }
    
    func configureCellWithOption(option : ShirtOrderInfo.ShirtFront) {
        self.optionLabel.text = option.rawValue;
        
        switch option {
        case ShirtOrderInfo.ShirtFront.HiddenButton:
            self.optionImage.image = UIImage(named: "shirt_front_hidden");
        case ShirtOrderInfo.ShirtFront.Placket:
            self.optionImage.image = UIImage(named: "shirt_front_placket");
        case ShirtOrderInfo.ShirtFront.Plain:
            self.optionImage.image = UIImage(named: "shirt_front_plain");
        }
    }
    
    func configureCellWithOption(option : ShirtOrderInfo.ShirtBack) {
        self.optionLabel.text = option.rawValue;
        
        switch option {
        case ShirtOrderInfo.ShirtBack.PlainWithDart:
            self.optionImage.image = UIImage(named: "shirt_back_dart");
        case ShirtOrderInfo.ShirtBack.SinglePleat:
            self.optionImage.image = UIImage(named: "shirt_back_single_pleat");
        case ShirtOrderInfo.ShirtBack.Plain:
            self.optionImage.image = UIImage(named: "shirt_back_plain");
        case ShirtOrderInfo.ShirtBack.BoxPleat:
            self.optionImage.image = UIImage(named: "shirt_back_box_pleat");
        }
    }
    
    func configureCellWithOption(option : PantsOrderInfo.Pleat) {
        self.optionLabel.text = option.rawValue;
        switch option {
        case PantsOrderInfo.Pleat.FlatFront:
            self.optionImage.image = UIImage(named: "pants_flat_front");
        case PantsOrderInfo.Pleat.Single:
            self.optionImage.image = UIImage(named: "pants_single_pleat");
        case PantsOrderInfo.Pleat.Double:
            self.optionImage.image = UIImage(named: "pants_double_pleat");
        }
    }
    
    func configureCellWithOption(option : VestOrderInfo.VestType) {
        self.optionLabel.text = option.rawValue;
        
        switch option {
        case VestOrderInfo.VestType.V1:
            self.optionImage.image = UIImage(named: "vest_v1");
        case VestOrderInfo.VestType.V4:
            self.optionImage.image = UIImage(named: "vest_v4");
        case VestOrderInfo.VestType.V6:
            self.optionImage.image = UIImage(named: "vest_v6");
        case VestOrderInfo.VestType.V8:
            self.optionImage.image = UIImage(named: "vest_v8");
        case VestOrderInfo.VestType.V12:
            self.optionImage.image = UIImage(named: "vest_v12");
        default:
            print("no image");
        }
    }
    
    func configureCellWithOption(option : JacketOrderInfo.Lapel) {
        self.optionLabel.text = option.rawValue;
        
        switch option {
        case JacketOrderInfo.Lapel.Notch:
            self.optionImage.image = UIImage(named: "jacket_lapel_notch");
        case JacketOrderInfo.Lapel.Peak:
            self.optionImage.image = UIImage(named: "jacket_lapel_peak");
        case JacketOrderInfo.Lapel.Shawl:
            self.optionImage.image = UIImage(named: "jacket_lapel_shawl");
        default:
            print("no image");
        }
    }
    
    func configureCellWithOption(option : JacketOrderInfo.Lining) {
        self.optionLabel.text = option.rawValue;
        
        switch option {
        case JacketOrderInfo.Lining.Full:
            self.optionImage.image = UIImage(named: "jacket_lining_full");
        case JacketOrderInfo.Lining.Quarter:
            self.optionImage.image = UIImage(named: "jacket_lining_quarter");
        case JacketOrderInfo.Lining.Unconstructed:
            self.optionImage.image = UIImage(named: "jacket_lining_unconstructed");
        }
    }
    
    func configureCellWithOption(option : JacketOrderInfo.Buttons) {
        self.optionLabel.text = option.rawValue;
        
        switch option {
        case JacketOrderInfo.Buttons.Single:
            self.optionImage.image = UIImage(named: "jacket_button_single");
        case JacketOrderInfo.Buttons.Two:
            self.optionImage.image = UIImage(named: "jacket_button_two");
        case JacketOrderInfo.Buttons.Three:
            self.optionImage.image = UIImage(named: "jacket_button_three");
        case JacketOrderInfo.Buttons.DoubleBreasted:
            self.optionImage.image = UIImage(named: "jacket_button_double_breasted");
        }
    }
    
    func configureCellWithOption(option : JacketOrderInfo.Pockets) {
        self.optionLabel.text = option.rawValue;
        
        switch option {
        case JacketOrderInfo.Pockets.Regular:
            self.optionImage.image = UIImage(named: "jacket_pocket_regular");
        case JacketOrderInfo.Pockets.Slanted:
            self.optionImage.image = UIImage(named: "jacket_pocket_slanted");
        }
    }
    
    func configureCellWithOption(option : JacketOrderInfo.Vent) {
        self.optionLabel.text = option.rawValue;
        
        switch option {
        case JacketOrderInfo.Vent.None:
            self.optionImage.image = UIImage(named: "jacket_vent_none");
        case JacketOrderInfo.Vent.Center:
            self.optionImage.image = UIImage(named: "jacket_vent_center");
        case JacketOrderInfo.Vent.Side:
            self.optionImage.image = UIImage(named: "jacket_vent_side");
        }
    }
    
    func configureCellWithOption(option : JacketOrderInfo.Stitch) {
        self.optionLabel.text = option.rawValue;
        
        switch option {
        case JacketOrderInfo.Stitch.None:
            self.optionImage.image = UIImage(named: "jacket_stitch_none");
        case JacketOrderInfo.Stitch.Hand:
            self.optionImage.image = UIImage(named: "jacket_stitch_hand");
        case JacketOrderInfo.Stitch.QuarterMachine:
            self.optionImage.image = UIImage(named: "jacket_stitch_machine");
        }
    }
    
    func configureCellWithOption(option : JacketOrderInfo.Cuffs) {
        self.optionLabel.text = option.rawValue;
        
        switch option {
        case JacketOrderInfo.Cuffs.ButtonholeReady:
            self.optionImage.image = UIImage(named: "jacket_cuffs_buttonhole_ready");
        case JacketOrderInfo.Cuffs.Functional:
            self.optionImage.image = UIImage(named: "jacket_cuffs_functional");
        }
    }
}

