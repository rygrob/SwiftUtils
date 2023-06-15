import Foundation

public extension CGPoint {
    func distance(to other: CGPoint) -> CGFloat {
        return sqrt(pow(self.x - other.x, 2) + pow(self.y - other.y, 2))
    }
    
    func translation(from other: CGPoint) -> CGPoint {
        return .init(x: self.x - other.x, y: self.y - other.y)
    }
}
