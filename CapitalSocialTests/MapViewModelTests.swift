//
//  MapViewModelTests.swift
//  CapitalSocialTests
//
//  Created by Marcos Garcia on 12/23/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import XCTest

class MapViewModelTests: XCTestCase {

    func test_parseLocationsFrom_Configuration_File_Should_ReturnValidDictionary() {
        /// Given
        let sut = MapViewModel.init()
        
        /// When
        let dictionary = sut.parseLocationsFrom("Locations")
        
        /// Then
        XCTAssertNotNil(dictionary, "The dictionary with elements should not be nil")
        XCTAssertEqual(dictionary?.first?["lat"], 19.4141, "Latitude for the first elements should match")
        XCTAssertEqual(dictionary?.first?["long"], -99.1799, "Longitud for the first elements should match")
    }
    
    func test_getLocationsFor_Dictionary_ShouldReturn_Valid_Array_Of_Locations() {
        /// Given
        let sut = MapViewModel.init()
        let arrayOfLocations:[[String: NSNumber]] = [["lat": 1.23434, "long": -0.4667], ["lat": 2.23434, "long": 4.4667]]
        
        /// When
        let locations = sut.getLocationsFor(arrayOfLocations)
        
        /// Then
        XCTAssertNotNil(locations, "Locations should not be nil")
        XCTAssertEqual(locations?.count, 2, "Locations array should contain 2 elements")
        XCTAssertEqual(locations?.first?.latitude, 1.23434, "Location latitude should match")
        XCTAssertEqual(locations?.first?.longitude, -0.4667, "Location longitude should match")
    }
}

