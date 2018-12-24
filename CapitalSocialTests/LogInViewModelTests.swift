//
//  LogInViewModelTests.swift
//  CapitalSocialTests
//
//  Created by Marcos Garcia on 12/23/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import XCTest

class LogInViewModelTests: XCTestCase {

    func test_requestAccessWith_ValidUserInformation_Should_UpdatedData() {
        /// Given
        let sut = LogInViewModel.init()
        let expectation = XCTestExpectation(description: "Call should be successfully completed and challenges updated")
        
        /// When
        sut.requestAccessWith(user: "Luis", password: "password") { (response) in
            if response != nil {
                expectation.fulfill()
            }
        }
        
        /// Then
        wait(for: [expectation], timeout: 10.0)
    }
    
    func test_UpdateUser_WithInformation_ShouldBeReflected_AtKeychain() {
        
    }
}

