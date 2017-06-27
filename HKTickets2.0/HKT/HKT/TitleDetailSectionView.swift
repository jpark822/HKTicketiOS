//
//  TitleDetailSectionView.swift
//  HKT
//
//  Created by Jay Park on 6/25/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import UIKit

protocol TitleDetailSectionViewDelegate:class {
    func titleDetailSectionViewTapped(sectionView:TitleDetailSectionView)
}

class TitleDetailSectionView: UIView {

    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var mainDetailLabel: UILabel!
    
    weak var delegate:TitleDetailSectionViewDelegate?
    
    var tapRecognizer = UITapGestureRecognizer()
    
    //used in delegate to determine section
    var section:Int = -1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(titleDetailSectionViewWasTapped))
        self.addGestureRecognizer(tapRecognizer)
    }
    
    func setLabels(title:String, detail:String) {
        self.mainTitleLabel.text = title
        self.mainDetailLabel.text = detail
    }
    
    func titleDetailSectionViewWasTapped() {
        if let delegate = self.delegate {
            delegate.titleDetailSectionViewTapped(sectionView: self)
        }
    }
    
    deinit {
        self.removeGestureRecognizer(self.tapRecognizer)
    }
}
