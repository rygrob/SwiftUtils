//
//  File.swift
//  
//
//  Created by Ryan Robinson on 5/31/23.
//

import Foundation

extension UserDefaults {
    func set<T>(_ value: T, forKey: String) where T: Encodable {
        if let encoded = try? JSONEncoder().encode(value) {
            setValue(encoded, forKey: forKey)
        }
    }

    func get<T>(forKey: String) -> T? where T: Decodable {
        guard let data = value(forKey: forKey) as? Data,
            let decodedData = try? JSONDecoder().decode(T.self, from: data)
            else { return nil }
        return decodedData
    }
}
