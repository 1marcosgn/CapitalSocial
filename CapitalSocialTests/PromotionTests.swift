//
//  PromotionTests.swift
//  CapitalSocialTests
//
//  Created by Marcos Garcia on 12/23/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import XCTest

class PromotionTests: XCTestCase {
    
    func test_Promotion_Should_HaveValidData_When_Initialized() {
        /// Given
        var container = [String: Any]()
        let url = URL(string: "https://user-images.githubusercontent.com/6865674/50037256-41f44300-ffc4-11e8-957d-4ac2254c4867.png")
        let title = "Cinepolis"
        let description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in tortor non lorem mattis malesuada. Cras a lorem tristique, tincidunt dui id, molestie justo. Nam convallis risus euismod felis dignissim placerat. Nunc mollis sagittis ultricies. Aliquam ut placerat leo. In at tortor ut felis eleifend feugiat suscipit eu justo. Duis at dolor gravida, vestibulum orci id, aliquet est. Duis lobortis lorem eget consequat volutpat. Sed ut nunc sed magna varius dapibus ut ut ipsum. Donec et rhoncus elit. In ultricies pharetra augue, id posuere nulla. Integer eu ornare tellus. Aenean volutpat hendrerit neque, id varius nunc ornare faucibus. Integer cursus molestie leo, eget malesuada eros hendrerit dictum. Ut nisi ipsum, volutpat eu imperdiet eleifend, tristique eu turpis."
        
        container["imageUrl"] = url
        container["title"] = title
        container["description"] = description
        
        /// When
        let sut = Promotion.init(information: container)
        
        /// Then
        XCTAssertNotNil(sut.imageUrl, "This should not be nil")
        XCTAssertNotNil(sut.title, "This should not be nil")
        XCTAssertNotNil(sut.description, "This should not be nil")
        
        XCTAssertEqual(sut.imageUrl, url, "This property should match with the information provided")
        XCTAssertEqual(sut.title, title, "This property should match with the information provided")
        XCTAssertEqual(sut.description, description, "This property should match with the information provided")
    }
}

