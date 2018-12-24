//
//  LocationsFactory.swift
//  CapitalSocial
//
//  Created by Marcos Garcia on 12/23/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import UIKit

class LocationsFactory: NSObject {
    
    private static var sharedLocationsFactory = LocationsFactory()
    
    /// Single instance of LocationsFactory
    class func shared() -> LocationsFactory {
        return sharedLocationsFactory
    }
    
    /// Creates and returns Locations based on a Dictionary with the locations information
    public func makeLocationsWith(_ coordinates: [[String: Float]]?) -> [Location]? {
        var locationsArray = [Location]()
        
        guard let locations = coordinates else {
            return nil
        }
        
        for location in locations {
            
            guard let latitude = location["lat"] as NSNumber?,
                let longitude = location["long"] as NSNumber? else {
                    return nil
            }
            locationsArray.append(Location.init(lat: latitude, long: longitude))
        }
        
        return locationsArray
    }
}

