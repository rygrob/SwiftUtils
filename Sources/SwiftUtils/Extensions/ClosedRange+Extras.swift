import Foundation

public extension ClosedRange where Bound: AdditiveArithmetic {
    /// Get the size of the range, e.g. the difference between the upper and lower bounds.
    var size: Self.Bound {
        return self.upperBound - self.lowerBound
    }
}

public extension ClosedRange where Bound: BinaryFloatingPoint {
    /// Get the midpoint of the range, e.g. the average of the upper and lower bounds.
    var midpoint: Self.Bound {
        return (self.lowerBound + self.upperBound) / Self.Bound(2)
    }
    
    /// Get the upper half range of the receiver. Includes the midpoint.
    var upperHalfRange: Self {
        get {
            return self.midpoint...self.upperBound
        }
    }
    
    /// Get the lower half range of the receiver. Includes the midpoint.
    var lowerHalfRange: Self {
        get {
            return self.lowerBound...self.midpoint
        }
    }
}
