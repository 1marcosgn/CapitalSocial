//
//  RouterViewModel.swift
//  CapitalSocial
//
//  Created by Marcos Garcia on 12/24/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import UIKit

public class RouterViewModel: NSObject {
    /// Returns user status
    class func getUserStatus() -> UserStatus {
        return ProfileManager.shared().retrieveUserStatus()
    }
}
