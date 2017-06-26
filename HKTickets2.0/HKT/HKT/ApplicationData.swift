//
//  ApplicationData.swift
//  HKT
//
//  Created by Jay Park on 6/21/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import UIKit

class ApplicationData: NSObject {
    
    enum ApplicationDataKey:String {
        case Username = "kAppDataUsername"
        case Password = "kAppDataPassword"
        case AuthToken = "kAppDataAuthToken"
    }
    
    static let sharedInstance = ApplicationData()
    
    static var baseURLString:String {
        get {
            return "https://staging-hkt.azurewebsites.net/api"
        }
    }

    override init() {
        super.init()
    }
    
    static func setAppData(value:Any?, key:ApplicationDataKey) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    static func getAppData(key:ApplicationDataKey) -> Any?{
        return UserDefaults.standard.value(forKey: key.rawValue)
    }
}
