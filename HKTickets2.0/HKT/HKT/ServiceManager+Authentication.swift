//
//  ServiceManager+Authentication.swift
//  HKT
//
//  Created by Jay Park on 6/24/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//

extension ServiceManager {
    @discardableResult public func login(username:String, password:String, success: ((URLSessionDataTask, Any?) -> Swift.Void)?, failure: ((URLSessionDataTask?, Error) -> Swift.Void)?) -> URLSessionDataTask? {
        let params = ["username":username, "password" : password, "grant_type" : "password"]
        
        return self.post(ServiceRouter.login.path, parameters: params, progress: nil, success: { (task, response) in
            
            guard let responseDict = response as? Dictionary<String, Any?>,
                  let authToken = responseDict["access_token"] as? String else {
                    if let failure = failure {
                        failure(task, NSError())
                    }
                return
            }
            
            ApplicationData.username = username
            ApplicationData.password = password
            ApplicationData.authToken = authToken
            self.sessionManager.requestSerializer.setValue("bearer \(authToken)", forHTTPHeaderField: "Authentication")
            
            NSLog("Setting auth token to \(authToken)")
            
            if let success = success {
                success(task, response)
            }
            
        }) { (task, error) in
            if let failure = failure {
                failure(task, error)
            }
        }
    }
}
