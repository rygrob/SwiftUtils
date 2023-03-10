import Foundation

public extension String {
    var range: NSRange {
        NSRange(location: 0, length: count)
    }
    
    func isAlphanumeric() -> Bool {
        if self.isEmpty { return false }
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9_-]*$", options: .caseInsensitive)
        guard regex.firstMatch(in: self, options: [], range: range) != nil else {
            return false
        }
        return true
    }
}

public extension String {
    /// Convert a string of words to an alphanumeric string.
    func toAlphanumeric() -> String {
        return components(separatedBy: .alphanumerics.inverted).joined()
    }
    
    /// Convert a string of words to camelCase.
    func toCamelCase() -> String {
        var camel = self.capitalized.toAlphanumeric()
        guard let c = camel.popFirst() else { return "" }
        return c.lowercased() + camel
    }
    
    /// Convert a string of words to snake_case.
    func toSnakeCase() -> String {
        let lower = self.lowercased()
        let words = lower.components(separatedBy: .alphanumerics.inverted)
        var result: String = ""
        for word in words {
            result.append(word)
            result.append("_")
        }
        let _ = result.popLast()
        return result
    }
}

public extension String {
    /// Remove and return the first character of the receiver. Safe to call on an empty string.
    mutating func popFirst() -> Character? {
        return self.count > 0 ? self.removeFirst() : nil
    }
}
