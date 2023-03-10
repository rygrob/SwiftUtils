#if canImport(UIKit)

import UIKit


// MARK: - Anchoring

public extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero) {
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
    }
    
    func anchor(centerX: NSLayoutXAxisAnchor?, centerY: NSLayoutYAxisAnchor?, width: CGFloat?, height: CGFloat?) {
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func anchorToSuperviewEdges(padding: UIEdgeInsets = .zero) {
        guard let superview = superview else { return }
        anchor(top: superview.topAnchor,
               leading: superview.leadingAnchor,
               bottom: superview.bottomAnchor,
               trailing: superview.trailingAnchor,
               padding: padding)
    }
    
    @available(iOS 11.0, *)
    func anchorToSafeAreaLayoutGuides(padding: UIEdgeInsets = .zero) {
        guard let superview = superview else { return }
        anchor(top: superview.safeAreaLayoutGuide.topAnchor,
               leading: superview.safeAreaLayoutGuide.leadingAnchor,
               bottom: superview.safeAreaLayoutGuide.bottomAnchor,
               trailing: superview.safeAreaLayoutGuide.trailingAnchor,
               padding: padding)
    }
}


// MARK: - Guide Layers

public extension UIView {
    
    enum GuideAxis { case vertical, horizontal }
    
    /// Makes a set of zero-width guide layers (views) for easily anchoring other views.
    /// - Parameters:
    ///   - view: The parent view for the guide layers.
    ///   - axis: Horizontal or vertical.
    ///   - multipliers: The relative positions of the guide layers, on 0...1.
    ///   - debug: Setting true makes the guide layers one pixel wide with a red background color.
    /// - Returns: An array of appropriately constrained UIViews, which are subviews of the target view.
    static func makeGuideLayers(for view: UIView, axis: GuideAxis, multipliers: [CGFloat], debug: Bool = false) -> [UIView] {
        guard axis != .both else { return [] }
        
        var views: [UIView] = []
        
        for multiplier in multipliers {
            
            let v = UIView()
            v.translatesAutoresizingMaskIntoConstraints = false
            v.backgroundColor = debug ? .red : .clear
            view.addSubview(v)
            
            if axis == .horizontal {
                v.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
                v.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
                v.heightAnchor.constraint(equalToConstant: debug ? 1 : 0).isActive = true
                
                // Set top based on multiplier.
                NSLayoutConstraint(item: v, attribute: .top, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: multiplier, constant: 0).isActive = true
            }
            
            else if axis == .vertical {
                v.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
                v.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
                v.widthAnchor.constraint(equalToConstant: debug ? 1 : 0).isActive = true
                
                // Set leading based on multiplier.
                NSLayoutConstraint(item: v, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: multiplier, constant: 0).isActive = true
            }
            
            views.append(v)
        }
        
        return views
    }
    
    func makeGuideLayers(axis: GuideAxis, multipliers: [CGFloat], debug: Bool = false) -> [UIView] {
        return UIView.makeGuideLayers(for: self, axis: axis, multipliers: multipliers, debug: debug)
    }
}

#endif
