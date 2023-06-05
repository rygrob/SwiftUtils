import Foundation

@propertyWrapper
public struct Persistable<Value: Codable> {
    //
    let userDefaults: UserDefaults
    let key: String
    var value: Value
    
    public init(with userDefaults: UserDefaults, key: String, initialValue: Value) {
        // init
        self.userDefaults = userDefaults
        self.key = key
        self.value = initialValue
        
        // Is there a stored value? If so, use that.
        if let val = getFromStorage() {
            value = val
        }
        
        // Otherwise, store the initial value.
        else {
            store()
        }
    }
    
    public var wrappedValue: Value {
        get {
            return value
        }
        set {
            value = newValue
            store()
        }
    }
    
    private func getFromStorage() -> Value? {
        return userDefaults.get(forKey: key)
    }
    
    private func store() {
        userDefaults.set(value, forKey: key)
    }
}

@available(*, deprecated, message: "Prefer to use a property wrapper.")
public class PersistableValue<Element: Codable> {
    private let userDefaults: UserDefaults
    private let key: String
    private var value: Element
    
    /// Checks user defaults for a persisted value. Uses the initial value only if no persisted value is found.
    public init(with userDefaults: UserDefaults, key: String, initialValue: Element) {
        // Need to know.
        self.userDefaults = userDefaults
        self.key = key
        self.value = initialValue
        
        // Is there a stored value? If so, use that.
        if let val = getFromStorage() {
            value = val
        }
        
        // Otherwise, store the initial value.
        else {
            store()
        }
    }
    
    /// Get the value.
    public func get() -> Element {
        return value
    }
    
    /// Set the value. Will be stored in user defaults.
    public func set(_ val: Element) {
        value = val
        store()
    }
    
    private func getFromStorage() -> Element? {
        return userDefaults.get(forKey: key)
    }
    
    private func store() {
        userDefaults.set(value, forKey: key)
    }
}

