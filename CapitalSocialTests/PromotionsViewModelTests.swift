//
//  PromotionsViewModelTests.swift
//  CapitalSocialTests
//
//  Created by Marcos Garcia on 12/23/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import XCTest

class PromotionsViewModelTests: XCTestCase {

    func test_getPromotions_Should_Create_Valid_PromotionObjects() {
        /// Given
        let sut = PromotionsViewModel.init()
        
        /// When
        let arrayOfPromotions = sut.getPromotions()
        
        /// Then
        XCTAssertNotNil(arrayOfPromotions, "Array of promotions should not be nil")
    }
}

