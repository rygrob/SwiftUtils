#if canImport(UIKit)
import UIKit

public extension UIView {
    func findViewController() -> UIViewController? {
        if let next = self.next as? UIViewController {
            return next
        } else if let next = self.next as? UIView {
            return next.findViewController()
        } else {
            return nil
        }
    }
}
#endif
