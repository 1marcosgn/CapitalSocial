//
//  ServicesImplementer.swift
//  CapitalSocial
//
//  Created by Marcos Garcia on 12/23/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import UIKit
//import Alamofire // Alamofire not supported for iOS 8.0 .. we need to upgrade support for iOS 10.0

public class ServicesImplementer: NSObject {
    
    /// Validates if the user has access
    public func logInWith(userInformation: [String: [String: String]], responseObject: @escaping ([String: Any]?) -> ()) {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        let url = ServiceEndPoints.login
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = Constants.post
        request.addValue(Constants.ios, forHTTPHeaderField: Constants.so)
        request.addValue(Constants.versionNumber, forHTTPHeaderField: Constants.version)
        request.addValue(Constants.applicationJson, forHTTPHeaderField: Constants.contentType)
        
        var params :[String: Any]?
        params = userInformation
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: params!, options: JSONSerialization.WritingOptions())
            let task = session.dataTask(with: request as URLRequest as URLRequest, completionHandler: {(data, response, error) in
                if let response = response {
                    let nsHTTPResponse = response as! HTTPURLResponse
                    let statusCode = nsHTTPResponse.statusCode
                    print("status code = \(statusCode)")
                }
                if let error = error {
                    ServicesErrorHandler.handleError(error)
                    responseObject(nil)
                }
                if let data = data {
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions())
                        responseObject(jsonResponse as? [String: Any])
                    }catch _ {
                        ServicesErrorHandler.handleError(error)
                        responseObject(nil)
                    }
                }
            })
            task.resume()
        }catch _ {
            let error = NSError(domain: Constants.invalidParams, code: 1234, userInfo: nil)
            ServicesErrorHandler.handleError(error)
            responseObject(nil)
        }
    }
}

/// We are using this exxtension to grant authorization to the app so we can connect to a Server with and Invalid Certificate using NSURLSession
extension ServicesImplementer: URLSessionDelegate {
    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        let urlCredential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
        completionHandler(.useCredential, urlCredential)
    }
}

