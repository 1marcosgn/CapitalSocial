//
//  PromotionsViewModel.swift
//  CapitalSocial
//
//  Created by Marcos Garcia on 12/23/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import UIKit

public class PromotionsViewModel {
    /// Returns the available promotions for the App
    func getPromotions() -> [Promotion]? {
        guard let jsonResponse = JSONFormatter.parseWith(file: Constants.promotionsJson) else {
            return nil
        }
        return PromotionsFactory.shared().makePromotions(promotions: jsonResponse)
    }
}

