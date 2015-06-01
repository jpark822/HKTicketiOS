//
//  PantsOrderFormViewController.swift
//  HKTicketsSwift
//
//  Created by Jay Park on 5/25/15.
//  Copyright (c) 2015 JPApps. All rights reserved.
//

import UIKit

class PantsOrderFormViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var customerNameLabel: UILabel!

    @IBOutlet weak var pleatCollectionView: UICollectionView!
    @IBOutlet weak var liningSegmentedControl: UISegmentedControl!
    @IBOutlet weak var depthOfPleatTextField: UITextField!
    @IBOutlet weak var fabricTextField: UITextField!
    
    var pleatOptions : [PantsOrderInfo.Pleat] = [];
    var liningOptions : [PantsOrderInfo.Lining] = [];
    
    var existingPantOrder : PantsOrderInfo?;
    var fabrics : [String]?;
    
    var delegate : OrderFormDelegate?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let orderItemCellNib = UINib(nibName: "OrderItemCell", bundle: nil);
        self.pleatCollectionView.registerNib(orderItemCellNib, forCellWithReuseIdentifier: "orderOptionCellId")
        self.pleatCollectionView.dataSource = self;
        self.pleatCollectionView.delegate = self;
        
        self.pleatOptions = [PantsOrderInfo.Pleat.FlatFront, PantsOrderInfo.Pleat.Single, PantsOrderInfo.Pleat.Double];
        self.liningOptions = [PantsOrderInfo.Lining.Front, PantsOrderInfo.Lining.Full, PantsOrderInfo.Lining.None];
        
        if let existingOrder = self.existingPantOrder {
            self.setupControlsWithEditablePantInfo();
            self.fabricTextField.hidden = false;
        }
        else {
            self.pleatCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        }
    }
    
    func setupControlsWithEditablePantInfo() {
        self.fabricTextField.text = self.existingPantOrder?.fabric;
        self.fabricTextField.hidden = false;
        self.depthOfPleatTextField.text = self.existingPantOrder?.depthOfPleat;
        
        if let pleatIndex = find(self.pleatOptions, self.existingPantOrder!.pleat) {
            self.pleatCollectionView.selectItemAtIndexPath(NSIndexPath(forRow: pleatIndex, inSection: 0), animated: false, scrollPosition: UICollectionViewScrollPosition.None);
        }
        if let liningIndex = find(self.liningOptions, self.existingPantOrder!.lining) {
            self.liningSegmentedControl.selectedSegmentIndex = liningIndex;
        }
        
    }

    @IBAction func doneButtonPressed(sender: AnyObject) {
        if let fabrics = self.fabrics {
            var orders : [PantsOrderInfo]! = []
            
            for fabric in fabrics {
                var pantOrder = PantsOrderInfo();
                pantOrder.fabric = fabric;
                var selectedPleatIndexes = self.pleatCollectionView.indexPathsForSelectedItems() as! [NSIndexPath];
                pantOrder.pleat = self.pleatOptions[selectedPleatIndexes[0].row];
                pantOrder.lining = self.liningOptions[self.liningSegmentedControl.selectedSegmentIndex];
                pantOrder.depthOfPleat = self.depthOfPleatTextField.text;
                
                orders.append(pantOrder);
            }
            var pantMeasurementsVC = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("PantsMeasurementsControllerId") as! PantMeasurementViewController;
            pantMeasurementsVC.delegate = self.delegate;
            pantMeasurementsVC.pantOrders = orders;
            self.navigationController?.pushViewController(pantMeasurementsVC, animated: true);
        }
        else if let existingPant = self.existingPantOrder {
            existingPant.fabric = self.fabricTextField.text;
            var selectedPleatIndexes = self.pleatCollectionView.indexPathsForSelectedItems() as! [NSIndexPath];
            existingPant.pleat = self.pleatOptions[selectedPleatIndexes[0].row];
            existingPant.lining = self.liningOptions[self.liningSegmentedControl.selectedSegmentIndex];
            existingPant.depthOfPleat = self.depthOfPleatTextField.text;
            
            var pantMeasurementsVC = UIStoryboard(name: "HKTOrder", bundle: nil).instantiateViewControllerWithIdentifier("PantsMeasurementsControllerId") as! PantMeasurementViewController;
            pantMeasurementsVC.delegate = self.delegate;
            pantMeasurementsVC.existingPants = existingPant;
            self.navigationController?.pushViewController(pantMeasurementsVC, animated: true);
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var orderOptionCell = collectionView.dequeueReusableCellWithReuseIdentifier("orderOptionCellId", forIndexPath: indexPath) as! OrderOptionCell;
        orderOptionCell.configureCellWithOption(pleatOptions[indexPath.row]);
        return orderOptionCell;
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pleatOptions.count;
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(135, 135);
    }

}
