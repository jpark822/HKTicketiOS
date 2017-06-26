//
//  ServiceManager.swift
//  HKT
//
//  Created by Jay Park on 6/23/17.
//  Copyright © 2017 ThoughtSeize. All rights reserved.
//
import AFNetworking

class ServiceManager: NSObject {
    static let sharedInstance = ServiceManager()
    
    let sessionManager: AFHTTPSessionManager
    
    override init() {
        let config = URLSessionConfiguration.default
        let baseURL = URL(string: ApplicationData.baseURLString)
        self.sessionManager = AFHTTPSessionManager(baseURL: baseURL, sessionConfiguration: config)
        self.sessionManager.requestSerializer = AFHTTPRequestSerializer()
        self.sessionManager.responseSerializer = AFJSONResponseSerializer(readingOptions: [.mutableContainers])
        self.sessionManager.requestSerializer.setValue("application/x-www-form-urlencoded; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        if let authToken = ApplicationData.authToken {
            self.sessionManager.requestSerializer.setValue("bearer \(authToken)", forHTTPHeaderField: "Authorization")
        }
        
        
        super.init()
    }
    
    //MARK: Post wrapper defaults to auto re-authenticate
    @discardableResult public func post(_ URLString: String, parameters: Any?, progress uploadProgress: ((Progress) -> Swift.Void)?, success: ((URLSessionDataTask, Any?) -> Swift.Void)?, failure: ((URLSessionDataTask?, Error) -> Swift.Void)?) -> URLSessionDataTask? {
        return self.post(URLString, parameters: parameters, progress: uploadProgress, success: success, failure:failure, shouldRetry: true)
    }
    
    @discardableResult public func post(_ URLString: String, parameters: Any?, progress uploadProgress: ((Progress) -> Swift.Void)?, success: ((URLSessionDataTask, Any?) -> Swift.Void)?, failure: ((URLSessionDataTask?, Error) -> Swift.Void)?, shouldRetry:Bool) -> URLSessionDataTask? {
        
        return self.sessionManager.post(URLString, parameters: parameters, progress: uploadProgress, success: { (task, responseObject) in
            if let success = success {
                success(task, responseObject)
            }
        }) { (task, error) in
            if (shouldRetry) {
                guard let urlResponse = task?.response as? HTTPURLResponse,
                          urlResponse.statusCode == 401 else {
                    //failure was not due to authorization, so pass failure through and don't retry
                    if let failure = failure {
                        failure(task, error)
                    }
                    return
                }
                
                NSLog("Auth key expired, reauthenticating...")
                guard let username = ApplicationData.username,
                      let password = ApplicationData.password else {
                        if let failure = failure {
                            failure(task, error)
                        }
                        //TODO present login screen on main thread
                        return
                }
                self.login(username: username, password: password, success: { (task, response) in
                    //if reauthentication succeeds, retry request
                    self.post(URLString, parameters: parameters, progress: uploadProgress, success: success, failure: failure, shouldRetry: false)
                }, failure: { (task, error) in
                    if let failure = failure {
                        failure(task, error)
                        //TODO present login screen on main thread
                    }
                })
            }
            else {
                if let failure = failure {
                    failure(task, error)
                    //TODO present login screen on main thread
                }
            }
        }
    }
    
    //MARK: GET wrapper
    @discardableResult public func get(_ URLString: String, parameters: Any?, progress uploadProgress: ((Progress) -> Swift.Void)?, success: ((URLSessionDataTask, Any?) -> Swift.Void)?, failure: ((URLSessionDataTask?, Error) -> Swift.Void)?) -> URLSessionDataTask? {
        return self.get(URLString, parameters: parameters, progress: uploadProgress, success: success, failure:failure, shouldRetry: true)
    }
    
    @discardableResult public func get(_ URLString: String, parameters: Any?, progress uploadProgress: ((Progress) -> Swift.Void)?, success: ((URLSessionDataTask, Any?) -> Swift.Void)?, failure: ((URLSessionDataTask?, Error) -> Swift.Void)?, shouldRetry:Bool) -> URLSessionDataTask? {
        
        return self.sessionManager.get(URLString, parameters: parameters, progress: uploadProgress, success: { (task, responseObject) in
            if let success = success {
                success(task, responseObject)
            }
        }) { (task, error) in
            if (shouldRetry) {
                guard let urlResponse = task?.response as? HTTPURLResponse,
                    urlResponse.statusCode == 401 else {
                        //failure was not due to authorization, so pass failure through and don't retry
                        if let failure = failure {
                            failure(task, error)
                        }
                        return
                }
                
                NSLog("Auth key expired, reauthenticating...")
                guard let username = ApplicationData.username,
                    let password = ApplicationData.password else {
                        if let failure = failure {
                            failure(task, error)
                        }
                        //TODO present login screen on main thread
                        return
                }
                self.login(username: username, password: password, success: { (task, response) in
                    //if reauthentication succeeds, retry request
                    self.get(URLString, parameters: parameters, progress: uploadProgress, success: success, failure: failure, shouldRetry: false)
                }, failure: { (task, error) in
                    if let failure = failure {
                        failure(task, error)
                        //TODO present login screen on main thread
                    }
                })
            }
            else {
                if let failure = failure {
                    failure(task, error)
                    //TODO present login screen on main thread
                }
            }
        }
    }
    
    
    //MARK: parsing
    func convertJsonStringIntoDictionary(jsonString : String) -> Dictionary<String, AnyObject> {
        let objectData = jsonString.data(using: .utf8)
        
        var convertedDictionary = Dictionary<String, AnyObject>();
        do {
            convertedDictionary = try JSONSerialization.jsonObject(with: objectData!, options: [.mutableContainers]) as! Dictionary<String, AnyObject>
        }
        catch _ {
            
        }
        
        return convertedDictionary;
    }
}
