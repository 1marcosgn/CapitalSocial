//
//  ProfileManagerTests.swift
//  CapitalSocialTests
//
//  Created by Marcos Garcia on 12/23/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import XCTest

class ProfileManagerTests: XCTestCase {

    func test_retrieveUserStatus_ShouldReturn_UserStatus() {
        /// Given
        let sut = ProfileManager.shared()
        
        /// When
        let status = sut.retrieveUserStatus()
        
        /// Then
        XCTAssertNotNil(status, "Status should not be nil")
        XCTAssertEqual(status, .nonAuthenticated, "Status should match")
    }
}

