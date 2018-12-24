//
//  Promotion.swift
//  CapitalSocial
//
//  Created by Marcos Garcia on 12/23/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import UIKit

public class Promotion: PromotionProtocol {
    var imageUrl: URL?
    var title: String
    var description: String
    
    
    public init(information: [String: Any]) {
        self.imageUrl = information["imageUrl"] as? URL
        self.title = information["title"] as? String ?? ""
        self.description = information["description"] as? String ?? ""
    }
}

