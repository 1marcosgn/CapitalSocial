//
//  ServicesImplementerTests.swift
//  CapitalSocialTests
//
//  Created by Marcos Garcia on 12/23/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import XCTest

class ServicesImplementerTests: XCTestCase {

    func test_logInWith_UserInfo_Should_Get_User_Token() {
        /// Given
        let sut = ServicesImplementer.init()
        let expectation = XCTestExpectation(description: "Call should be successfully completed and challenges updated")
        let userInfo = ["pass": "password", "user": "Luis"]
        let infoContainer = ["data": userInfo]
        
        /// When
        sut.logInWith(userInformation: infoContainer) { (response) in
            if response != nil {
                expectation.fulfill()
            }
        }
        
        /// Then
        wait(for: [expectation], timeout: 10.0)
    }
}

