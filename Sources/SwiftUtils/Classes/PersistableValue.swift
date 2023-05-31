import Foundation

public class PersistableValue<Element> {
    
    private let userDefaults: UserDefaults
    private let key: String
    private var value: Element
    
    /// Checks user defaults for a persisted value. Uses the initial value only if no persisted value is found.
    public init(with userDefaults: UserDefaults, key: String, initialValue: Element) {
        // Need to know.
        self.userDefaults = userDefaults
        self.key = key
        
        // Is there a stored value? If so, start with that.
        if let val = userDefaults.value(forKey: key) as? Element {
            value = val
        }
        
        // Otherwise, use the initial value and store that.
        else {
            value = initialValue
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
    
    private func store() {
        userDefaults.setValue(value, forKey: key)
    }
}
