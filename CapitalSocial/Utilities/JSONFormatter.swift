//
//  JSONFormatter.swift
//  CapitalSocial
//
//  Created by Marcos Garcia on 12/23/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import UIKit

public class JSONFormatter {
    
    //TODO: TEST THIS METHOD
    class func parseWith(data: NSData) -> AnyObject? {
        do {
            return try JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers) as AnyObject
        } catch let error {
            print(error)
        }
        return nil
    }
    
    /// Use this method to get a dictionary with Promotions from a Local JSON File
    class func parseWith(file: String) -> [String: Any]? {
        if let path = Bundle.main.path(forResource: file, ofType: Constants.json) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                
                if let dictionary = json as? [String: Any] {
                    return dictionary
                }
            } catch {
                return nil
            }
        }
        return nil
    }
}

