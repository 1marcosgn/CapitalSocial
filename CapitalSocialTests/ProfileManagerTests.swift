//
//  ProfileManagerTests.swift
//  CapitalSocialTests
//
//  Created by Marcos Garcia on 12/23/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import XCTest
import SwiftKeychainWrapper

class ProfileManagerTests: XCTestCase {
    
    override func tearDown() {
        let _ = KeychainWrapper.standard.removeObject(forKey: "CapitalSocialUserToken")
    }

    func test_retrieveUserStatus_ShouldReturn_UserStatus() {
        /// Given
        let sut = ProfileManager.shared()
        
        /// When
        let status = sut.retrieveUserStatus()
        
        /// Then
        XCTAssertNotNil(status, "Status should not be nil")
        XCTAssertEqual(status, .nonAuthenticated, "Status should match")
    }
    
    func test_updateUserStatus_ShouldReturn_UserStatus() {
        /// Given
        let sut = ProfileManager.shared()
        let information = ["token": "a7a4566243b0505fc3ebe208348310d28721dbe2e1929239c534f26006a74283"]
        
        /// When
        sut.updateUserStatus(information)
        
        /// Then
        XCTAssertEqual(sut.retrieveUserStatus(), UserStatus.authenticated, "User should be authenticated now")
    }
}

