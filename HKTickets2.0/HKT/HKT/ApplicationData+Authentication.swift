//
//  ApplicationData+Authentication.swift
//  HKT
//
//  Created by Jay Park on 6/25/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

import Foundation

extension ApplicationData {
    static var username:String? {
        get {
            return getAppData(key: .Username) as? String
        }
        set {
            setAppData(value: newValue, key: .Username)
        }
    }
    
    static var password:String? {
        get {
            return getAppData(key: .Password) as? String
        }
        set {
            setAppData(value: newValue, key: .Password)
        }
    }
    
    static var authToken:String? {
        get {
            return getAppData(key: .AuthToken) as? String
        }
        set {
            setAppData(value: newValue, key: .AuthToken)
        }
    }
}
