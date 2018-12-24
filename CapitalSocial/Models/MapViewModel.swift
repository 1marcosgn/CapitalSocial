//
//  MapViewModel.swift
//  CapitalSocial
//
//  Created by Marcos Garcia on 12/23/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import UIKit

public class MapViewModel {
    /// Use this method to parse the location coming from a configuration file
    func parseLocationsFrom(_ fileName: String) -> [[String: NSNumber]]? {
        var arrayOfParsedLocations = [[String: NSNumber]]()
        var locations: NSDictionary?
        if let path = Bundle.main.path(forResource: fileName, ofType: Constants.plist) {
            locations = NSDictionary(contentsOfFile: path)
        }
        
        guard let theLocations = locations else {
            return nil
        }
        
        for location in theLocations {
            let dictWithValues = location.value as? Dictionary<String, Any>
            guard let lat = dictWithValues?[Constants.latitude] as? NSNumber,
                let long = dictWithValues?[Constants.longitude] as? NSNumber else {
                    return nil
            }
            
            arrayOfParsedLocations.append([Constants.latitude: lat, Constants.longitude: long])
        }
        
        return arrayOfParsedLocations
    }
    
    /// Use this method to get an array of possible locations based on a dictionary
    func getLocationsFor(_ coordinates:[[String: NSNumber]]) -> [Location]? {
        var arrayOfLocations = [Location]()
        
        for coordinateElement in coordinates {
            guard let lat = coordinateElement[Constants.latitude],
                let long = coordinateElement[Constants.longitude] else {
                    return nil
            }

            let location = Location.init(lat: lat, long: long)
            
            arrayOfLocations.append(location)
        }
        
        return arrayOfLocations
    }
}

