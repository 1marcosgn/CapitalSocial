//
//  JSONFormatterTests.swift
//  CapitalSocialTests
//
//  Created by Marcos Garcia on 12/23/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import XCTest

class JSONFormatterTests: XCTestCase {

    func test_parseWith_File_Should_Return_Valid_Object() {
        /// Given
        let object = JSONFormatter.parseWith(file: "Promotions")
        
        /// When
        let dictionary = object?["zonafitness"] as? [String: Any]
        
        /// Then
        XCTAssertNotNil(object, "object should not be nil")
        XCTAssertNotNil(object?["zonafitness"], "This object should be part of the json")
        XCTAssertNotNil(dictionary, "Dictionary should not be nil")
        XCTAssertEqual(dictionary?["name"] as? String, "Zona Fitness", "The name should match")
    }
}

