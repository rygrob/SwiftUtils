#if canImport(UIKit)

import UIKit

public extension UIView {
    static func getAllSubviews<T>(from parent: UIView) -> [T] {
        return parent.subviews.flatMap { subview -> [T] in
            var result = getAllSubviews(from: subview) as [T]
            if let view = subview as? T { result.append(view) }
            return result
        }
    }
    
    func getAllSubviews<T>(of: T.Type) -> [T] {
        return UIView.getAllSubviews(from: self) as [T]
    }
}

#endif
