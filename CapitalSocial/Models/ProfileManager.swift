//
//  ProfileManager.swift
//  CapitalSocial
//
//  Created by Marcos Garcia on 12/23/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import UIKit

public class ProfileManager: KeyChainWrapperProtocol {
    /// Shared instance
    private static var sharedProfileManager = ProfileManager()
    
    /// Single instance of PromotionsFactory
    class func shared() -> ProfileManager {
        return sharedProfileManager
    }
    
    /// Validates if the user is logged in pr not
    public func retrieveUserStatus() -> UserStatus {
        if let information = getInformation() {
            if information["token"] != nil {
                return .authenticated
            } else {
                return .nonAuthenticated
            }
        } else {
            return .nonAuthenticated
        }
    }
    
    /// Update the user token in the keychain using the protocol
    public func updateUserStatus( _ information: [String: Any]) {
        if let token = information["token"] as? String{
            updateInformation(token)
        }
    }
}

