//
//  LogInViewModel.swift
//  CapitalSocial
//
//  Created by Marcos Garcia on 12/23/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import UIKit

public class LogInViewModel {
    
    public func requestAccessWith(user: String, password: String, responseObject: @escaping ([String: Any]?) -> ()) {
        /// Create a dictionary with user information
        let userInfo = ["pass": password, "user": user]
        let data = ["data": userInfo]
        
        let serviceImplementer = ServicesImplementer.init()
        
        serviceImplementer.logInWith(userInformation: data) { (response) in
            if let serviceResponse = response {
                self.updateUserWith(serviceResponse)
                responseObject(serviceResponse)
            } else {
                responseObject(nil)
            }
        }
    }
}

internal extension LogInViewModel {
    internal func updateUserWith( _ information: [String: Any]) {
        ProfileManager.shared().updateUserStatus(information)
    }
}

