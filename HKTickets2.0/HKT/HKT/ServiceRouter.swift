//
//  ServiceRouter.swift
//  HKT
//
//  Created by Jay Park on 6/24/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import UIKit

enum ServiceRouter {
    case login
    case customers
    
    
    
    var path:String {
        get {
            switch self {
            case .login:
                return "oauth/token"
            case .customers:
                return "Customers"
            }
        }
    }
}
