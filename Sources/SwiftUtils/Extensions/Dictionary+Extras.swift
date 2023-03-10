import Foundation

public extension Dictionary where Key: Equatable {
    // Access values a little bit prettier.
    func at(_ key: Key) -> Value? {
        return self[key]
    }
}
