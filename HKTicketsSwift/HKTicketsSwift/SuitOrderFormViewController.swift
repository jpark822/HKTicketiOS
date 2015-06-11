//
//  SuitOrderFormViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 6/10/15.
//  Copyright © 2015 JPApps. All rights reserved.
//

import UIKit

class SuitOrderFormViewController: UIViewController {
    
    //Jacket
    @IBOutlet weak var jacketFabricTextField: UITextField!
    @IBOutlet weak var lapelCollectionView: UICollectionView!
    @IBOutlet weak var lapelWidthTextField: UITextField!
    @IBOutlet weak var liningCollectionView: UICollectionView!
    @IBOutlet weak var buttonCollectionView: UICollectionView!
    @IBOutlet weak var jacketFirstButtonTextField: UITextField!
    @IBOutlet weak var pocketsCollectionView: UICollectionView!
    @IBOutlet weak var ticketPocketSwitch: UISwitch!
    @IBOutlet weak var flapWidthTextField: UITextField!
    @IBOutlet weak var ventCollectionView: UICollectionView!
    @IBOutlet weak var stitchCollectionView: UICollectionView!
    @IBOutlet weak var buttonHoleLapelSwitch: UISwitch!
    @IBOutlet weak var cuffsCollectionView: UICollectionView!
    @IBOutlet weak var paddingSegmentedControl: UISegmentedControl!
    
    var lapelOptions : [JacketOrderInfo.Lapel] = [JacketOrderInfo.Lapel.Notch,
        JacketOrderInfo.Lapel.Peak,
        JacketOrderInfo.Lapel.Shawl,
        JacketOrderInfo.Lapel.Other];
    var jacketLiningOptions : [JacketOrderInfo.Lining] = [JacketOrderInfo.Lining.Full,
        JacketOrderInfo.Lining.Quarter,
        JacketOrderInfo.Lining.Unconstructed];
    var paddingOptions : [JacketOrderInfo.Padding] = [JacketOrderInfo.Padding.Light,
        JacketOrderInfo.Padding.Medium,
        JacketOrderInfo.Padding.Heavy,
        JacketOrderInfo.Padding.NotApplicable];
    var buttonOptions : [JacketOrderInfo.Buttons] = [JacketOrderInfo.Buttons.Single,
        JacketOrderInfo.Buttons.Two,
        JacketOrderInfo.Buttons.Three,
        JacketOrderInfo.Buttons.DoubleBreasted];
    var pocketOptions : [JacketOrderInfo.Pockets] = [JacketOrderInfo.Pockets.Regular,
        JacketOrderInfo.Pockets.Slanted];
    var ventOptions : [JacketOrderInfo.Vent] = [JacketOrderInfo.Vent.None,
        JacketOrderInfo.Vent.Center,
        JacketOrderInfo.Vent.Side];
    var stitchOptions : [JacketOrderInfo.Stitch] = [JacketOrderInfo.Stitch.None,
        JacketOrderInfo.Stitch.Hand,
        JacketOrderInfo.Stitch.QuarterMachine];
    var cuffsOptions : [JacketOrderInfo.Cuffs] = [JacketOrderInfo.Cuffs.ButtonholeReady,
        JacketOrderInfo.Cuffs.Functional];
    
    //Pants
    @IBOutlet weak var pantFabricTextField: UITextField!
    @IBOutlet weak var pleatCollectionView: UICollectionView!
    @IBOutlet weak var liningSegmentedControl: UISegmentedControl!
    @IBOutlet weak var depthOfPleatTextField: UITextField!
    
    var pleatOptions : [PantsOrderInfo.Pleat] = [PantsOrderInfo.Pleat.FlatFront, PantsOrderInfo.Pleat.Single, PantsOrderInfo.Pleat.Double];
    var PantsLiningOptions : [PantsOrderInfo.Lining] = [PantsOrderInfo.Lining.Front, PantsOrderInfo.Lining.Full, PantsOrderInfo.Lining.None];
    
    //Vest
    @IBOutlet weak var vestFabricTextField: UITextField!
    @IBOutlet weak var includeVestSwitch: UISwitch!
    @IBOutlet weak var vestCollectionView: UICollectionView!
    @IBOutlet weak var vestFirstButtonTextField: UITextField!
    
    var vestOptions : [VestOrderInfo.VestType] = [VestOrderInfo.VestType.V1,
        VestOrderInfo.VestType.V4,
        VestOrderInfo.VestType.V6,
        VestOrderInfo.VestType.V8,
        VestOrderInfo.VestType.V12,
        VestOrderInfo.VestType.Other];
    
    //Overall Suit
    @IBOutlet weak var overallNotesTextField: UITextView!
    @IBOutlet var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.contentSize = CGSizeMake(768, 2700);
    }
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
    }
}
