//
//  UserDefaults.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 09/05/22.
//

import Foundation

extension UserDefaults {
    
    // Enum for storing key value pairs for userdefaults
    private enum UserDefaultKeys: String {
        case hasOnboarded
    }
    
    var hasOnboarded: Bool {
        get {
            bool(forKey: UserDefaultKeys.hasOnboarded.rawValue)
        } set {
            setValue(newValue, forKey: UserDefaultKeys.hasOnboarded.rawValue)
        }
    }
    
}

