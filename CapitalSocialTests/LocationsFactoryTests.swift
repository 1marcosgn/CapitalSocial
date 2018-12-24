//
//  LocationsFactoryTests.swift
//  CapitalSocialTests
//
//  Created by Marcos Garcia on 12/23/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import XCTest

class LocationsFactoryTests: XCTestCase {

    func test_Location_Factory_ShouldBeAbleTo_Create_Locations() {
        /// Given
        let sut = LocationsFactory.shared()
        var arrayOfLocations: [[String: Float]]
        
        arrayOfLocations = [["lat": 1.2344, "long": 3.35353], ["lat": 3.76876, "long": 5.3434]]
        
        /// When
        let locations = sut.makeLocationsWith(arrayOfLocations)
        
        /// Then
        XCTAssertNotNil(locations, "Locations should not be nil")
        XCTAssertEqual(locations?.count, 2, "Locations array should contain 2 elements")
    }
}

