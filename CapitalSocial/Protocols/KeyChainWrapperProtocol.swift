//
//  KeyChainWrapperProtocol.swift
//  CapitalSocial
//
//  Created by Marcos Garcia on 12/23/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import UIKit

public protocol KeyChainWrapperProtocol {
    /// Retrieves information from the keychain
    func getInformation() -> [String: String]?

    /// Updates the information in the keychain
    func updateInformation(_ token: String)
}

public extension KeyChainWrapperProtocol {
    func getInformation() -> [String: String]? {
        // retrieves the token with the framework
        return nil
    }
    
    func updateInformation(_ token: String) {
        //update in the keychain with the framework
    }
}

