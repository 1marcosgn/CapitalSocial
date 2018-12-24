//
//  ServicesErrorHandler.swift
//  CapitalSocial
//
//  Created by Marcos Garcia on 12/23/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import UIKit

public class ServicesErrorHandler {
    
    /// Handles the errors providign a extended description
    class func handleError(_ error: Error?) {
        debugPrint(error.debugDescription)
    }
}

