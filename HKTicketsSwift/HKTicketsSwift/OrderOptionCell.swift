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
        default:
            println("no image");
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
        default:
            println("no image");
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
        default:
            println("no image");
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
        default:
            println("no image");
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
        default:
            println("no image");
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
        default:
            println("no image");
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
}

