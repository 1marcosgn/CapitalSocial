//
//  KeyChainWrapperProtocol.swift
//  CapitalSocial
//
//  Created by Marcos Garcia on 12/23/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

public protocol KeyChainWrapperProtocol {
    /// Retrieves information from the keychain
    func getInformation() -> String?

    /// Updates the information in the keychain
    func updateInformation(_ token: String)
}

public extension KeyChainWrapperProtocol {
    func getInformation() -> String? {
        // retrieves the token with the framework
        let retrievedString: String? = KeychainWrapper.standard.string(forKey: "CapitalSocialUserToken")
        return retrievedString
    }
    
    func updateInformation(_ token: String) {
        //update in the keychain with the framework
        let saveSuccessful: Bool = KeychainWrapper.standard.set(token, forKey: "CapitalSocialUserToken")
        if saveSuccessful {
            print("all good")
        }
    }
}

