//
//  Location.swift
//  CapitalSocial
//
//  Created by Marcos Garcia on 12/23/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import UIKit

public class Location {
    
    public let latitude: NSNumber
    public let longitude: NSNumber
    
    init(lat: NSNumber, long: NSNumber) {
        self.latitude = lat
        self.longitude = long
    }
}

