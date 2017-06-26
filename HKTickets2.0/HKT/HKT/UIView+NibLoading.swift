//
//  UIView+NibLoading.swift
//  HKT
//
//  Created by Jay Park on 6/25/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import Foundation

extension UIView {
    class func fromNib<T : UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
