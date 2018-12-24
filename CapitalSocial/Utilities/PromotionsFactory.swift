//
//  PromotionsFactory.swift
//  CapitalSocial
//
//  Created by Marcos Garcia on 12/23/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import UIKit

class PromotionsFactory {
    
    private static var sharedPromotionsFactory = PromotionsFactory()
    
    /// Single instance of PromotionsFactory
    class func shared() -> PromotionsFactory {
        return sharedPromotionsFactory
    }
    
    /**
     Creates and returns Promotions based on a Dictionary with the promotions information
     - parameter promotions: Array of Dictionaries with information required to build a Promotion
     - returns: Array of Promotions
     */
    public func makePromotions(promotions: [String: Any]) -> [Promotion]? {
        var promotionsArray = [Promotion]()

        for promotion in promotions {
            guard let promotionDictionary = promotion.value as? [String: Any] else {
                return nil
            }
            promotionsArray.append(Promotion.init(information: promotionDictionary))
        }

        return promotionsArray
    }
}

