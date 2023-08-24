//
//  File.swift
//  
//
//  Created by Ryan Robinson on 8/24/23.
//

import Foundation

@propertyWrapper
public struct Storage<Value: Codable> {
    //
    let userDefaults: UserDefaults
    let key: String
    var defaultValue: Value
    
    public init(with userDefaults: UserDefaults, key: String, initialValue: Value) {
        // init
        self.userDefaults = userDefaults
        self.key = key
        self.defaultValue = initialValue
    }
    
    public var wrappedValue: Value {
        get {
            return getFromStorage() ?? defaultValue
        }
        set {
            store(newValue)
        }
    }
    
    private func getFromStorage() -> Value? {
        return userDefaults.get(forKey: key)
    }
    
    private func store(_ newValue: Value) {
        userDefaults.set(newValue, forKey: key)
    }
}
