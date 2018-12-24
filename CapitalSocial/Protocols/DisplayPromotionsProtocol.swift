//
//  DisplayPromotionsProtocol.swift
//  CapitalSocial
//
//  Created by Marcos Garcia on 12/23/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import UIKit

public protocol DisplayPromotionsProtocol {
    /// Navigaates to the Map View
    func goToMap()
    
    /// Navigates to the Detail View for an Specific Promotion
    func goToDetailFor(_ promotion: Promotion)
}

