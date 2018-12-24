//
//  PromotionProtocol.swift
//  CapitalSocial
//
//  Created by Marcos Garcia on 12/22/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import UIKit

/// Protocol to handle the Promotion properties
protocol PromotionProtocol {
    /// The image for the promotion
    var imageUrl: URL? { get set }
    
    /// The title of the promotion
    var title: String { get set }
    
    /// The descrption of the promotion
    var description: String { get set }
}

