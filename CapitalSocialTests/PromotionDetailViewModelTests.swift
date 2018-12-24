//
//  PromotionDetailViewModelTests.swift
//  CapitalSocialTests
//
//  Created by Marcos Garcia on 12/23/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import XCTest

class PromotionDetailViewModelTests: XCTestCase {

    func test_getSharePromotionActivityView_Should_Return_Valid_VC() {
        //// Given
        let sut: PromotionDetailViewModel?
        
        let mockInformation = PromotionsFactoryTests.init().getMockPromotion()
        let mockPromotion = Promotion(information: mockInformation)
        
        /// When
        sut = PromotionDetailViewModel(promotion: mockPromotion)
        let activityVC = sut?.getSharePromotionActivityView()
        
        /// Then
        XCTAssertNotNil(activityVC, "Activity share view controller should not be nil")
    }
}

