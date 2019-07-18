//
//  UIView+SUIKit.swift
//  Pods
//
//  Created by Maxim on 7/17/19.
//

import UIKit

//public protocol SUIViewModifier {
//    associatedtype Content: UIView
//    func modification(_ view: Content)
//}

//MARK: - Init
public extension UIView {
    
    /// Initializes and returns a newly allocated view object with specified subviews added.
    ///
    /// The new view object must be inserted into the view hierarchy of a window before it can be used.
    ///
    /// - Parameter content: Closure, that specifies subviews to be added to the view hierarcy after initialization.
    convenience init(content: () -> UIView) {
        self.init()
        place(content: content)
    }
    
}

//MARK: - Other
public extension UIView {
    
    /// Links the outer variable to the caller instance.
    ///
    /// Does nothing if caller instance is not castable to a variable type,
    /// otherwise erases outer variable and places the caller instance address into it.
    ///
    /// - Parameter ref: Outer variable, that will be linked to the caller instance.
    /// - Returns: Caller instance.
    @discardableResult
    func link<T: UIView>(to ref: inout T?) -> Self {
        modify{ if let self = $0 as? T { ref = self }}
    }
    
    /// Provides a closure with the caller instance as a parameter.
    ///
    /// Use it to modify caller instance.
    ///
    /// Override this method in custom UIView classes with your class modification parameter:
    ///
    /// ```(Class)->Void```
    ///
    /// to provide more convinient API.
    ///
    /// - Parameter modification: Closure that takes the caller instance as a parameter,
    /// - Returns: Caller instance.
    @discardableResult
    @objc func modify(_ modification: (UIView)->Void) -> Self {
        modification(self)
        return self
    }
    
    /// Hides the caller instance.
    ///
    /// The same as `.isHidden = true`, but fits SUIKit's chainable API
    /// - Returns: Caller instance.
    @discardableResult
    func hide() -> Self {
        modify{ $0.isHidden = true }
    }
    
    /// Shows the caller instance.
    ///
    /// The same as `.isHidden = false`, but fits SUIKit's chainable API
    /// - Returns: Caller instance.
    @discardableResult
    func show() -> Self {
        modify{ $0.isHidden = false }
    }
    
}

// MARK: - Colors
public extension UIView {
    
    /// Sets the opacity of the caller instance by changing it's alpha value.
    ///
    /// - Parameter value: A new alpha value of the caller instance.
    /// - Returns: Caller instance.
    @discardableResult
    func alpha(_ value: CGFloat) -> Self {
        modify { $0.alpha = value }
    }
    
    /// Sets the background color of the caller instance.
    ///
    /// - Parameter color: A new backgroundColor of the caller instance.
    /// - Returns: Caller instance.
    @discardableResult
    func background(color: UIColor?) -> Self {
        modify { $0.backgroundColor = color }
    }
    
    /// Sets the tint color of the caller instance.
    ///
    /// - Parameter color: A new tintColor of the caller instance.
    /// - Returns: Caller instance.
    @discardableResult
    func tint(color: UIColor) -> Self {
        modify { $0.tintColor = color }
    }

}

// MARK: - Corners
public extension UIView {
    
    /// Sets the corner radius of the view by masking specified corners.
    ///
    /// - Parameter value: A new cornerRadius of the caller instance's layer.
    /// - Parameter corners: Set of corners to create a new maskedCorners value of the caller instance's layer.
    @discardableResult
    func cornerRadius(_ value: CGFloat, corners: CACornerMask.Corner...) -> Self {
        cornerRadius(value, corners: Set(corners))
    }
    
    /// Sets the corner radius of the view by masking specified corners.
    ///
    /// - Parameter value: A new cornerRadius of the caller instance's layer.
    /// - Parameter corners: Set of corners to create a new maskedCorners value of the caller instance's layer. (`.all` by default)
    @discardableResult
    func cornerRadius(_ value: CGFloat, corners: CACornerMask.Corners = .all) -> Self {
        modify {
            $0.layer.cornerRadius = value
            $0.layer.maskedCorners = .init(corners)
        }
    }
    
}

// MARK: - Frame
public extension UIView {
    
    @discardableResult
    func frame(x: Int, y: Int, width: Int, height: Int) -> Self {
        frame(.init(x: x, y: y, width: width, height: height))
    }
    
    @discardableResult
    func frame(x: Double, y: Double, width: Double, height: Double) -> Self {
        frame(.init(x: x, y: y, width: width, height: height))
    }
    
    @discardableResult
    func frame(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> Self {
        frame(.init(x: x, y: y, width: width, height: height))
    }

    @discardableResult
    func frame(_ rect: CGRect) -> Self {
        modify { $0.frame = rect }
    }
    
}

// MARK: - Bounds
public extension UIView {
    
    @discardableResult
    func bounds(x: Int, y: Int, width: Int, height: Int) -> Self {
        bounds(.init(x: x, y: y, width: width, height: height))
    }
    
    @discardableResult
    func bounds(x: Double, y: Double, width: Double, height: Double) -> Self {
        bounds(.init(x: x, y: y, width: width, height: height))
    }
    
    @discardableResult
    func bounds(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> Self {
        bounds(.init(x: x, y: y, width: width, height: height))
    }
    
    @discardableResult
    func bounds(_ rect: CGRect) -> Self {
        modify { $0.bounds = rect }
    }
    
}

// MARK: - Origin
public extension UIView {
    
    @discardableResult
    func origin(x: Int, y: Int) -> Self {
        origin(.init(x: x, y: y))
    }
    
    @discardableResult
    func origin(x: Double, y: Double) -> Self {
        origin(.init(x: x, y: y))
    }
    
    @discardableResult
    func origin(x: CGFloat, y: CGFloat) -> Self {
        origin(.init(x: x, y: y))
    }
    
    @discardableResult
    func origin(_ point: CGPoint) -> Self {
        modify { $0.frame.origin = point }
    }
    
}

// MARK: - Size
public extension UIView {
    
    @discardableResult
    func size(width: Int, height: Int) -> Self {
        size(.init(width: width, height: height))
    }
    
    @discardableResult
    func size(width: Double, height: Double) -> Self {
        size(.init(width: width, height: height))
    }
    
    @discardableResult
    func size(width: CGFloat, height: CGFloat) -> Self {
        size(.init(width: width, height: height))
    }
    
    @discardableResult
    func size(_ size: CGSize) -> Self {
        modify { $0.bounds.size = size }
    }
    
}

// MARK: - Center
public extension UIView {
    
    @discardableResult
    func center(x: Int, y: Int) -> Self {
        center(.init(x: x, y: y))
    }
    
    @discardableResult
    func center(x: Double, y: Double) -> Self {
        center(.init(x: x, y: y))
    }
    
    @discardableResult
    func center(x: CGFloat, y: CGFloat) -> Self {
        center(.init(x: x, y: y))
    }
    
    @discardableResult
    func center(_ point: CGPoint) -> Self {
        modify { $0.center = point }
    }
    
}

// MARK: - Gesture recognizers
public extension UIView {
    
    @discardableResult
    func tapRecognizer(target: Any? = self, action: Selector?) -> Self {
        gestureRecognizer(UITapGestureRecognizer(target: target, action: action))
    }
    
    @discardableResult
    func panRecognizer(target: Any? = self, action: Selector?) -> Self {
        gestureRecognizer(UIPanGestureRecognizer(target: target, action: action))
    }

    @discardableResult
    func pressRecognizer(target: Any? = self, action: Selector?) -> Self {
        gestureRecognizer(UILongPressGestureRecognizer(target: target, action: action))
    }
    
    @discardableResult
    func swipeRecognizer(target: Any? = self, action: Selector?) -> Self {
        gestureRecognizer(UISwipeGestureRecognizer(target: target, action: action))
    }
    
    @discardableResult
    func pinchRecognizer(target: Any? = self, action: Selector?) -> Self {
        gestureRecognizer(UIPinchGestureRecognizer(target: target, action: action))
    }
    
    @discardableResult
    func rotationRecognizer(target: Any? = self, action: Selector?) -> Self {
        gestureRecognizer(UIRotationGestureRecognizer(target: target, action: action))
    }
    
    @discardableResult
    func gestureRecognizer(_ recognizer: UIGestureRecognizer) -> Self {
        modify { $0.addGestureRecognizer(recognizer) }
    }
    
}

// MARK: - Subviews
public extension UIView {
    
    @discardableResult
    func place(content: ()->UIView) -> Self {
        place(view: content())
    }
    
    @discardableResult
    func place(content: ()->UIView, at index: Int) -> Self {
        place(view: content(), at: index)
    }
    
    @discardableResult
    func place(content: ()->UIView, above subview: UIView) -> Self {
        place(view: content(), above: subview)
    }
    
    @discardableResult
    func place(content: ()->UIView, below subview: UIView) -> Self {
        place(view: content(), below: subview)
    }
    
    @discardableResult
    func place(view: UIView) -> Self {
        modify { $0.addSubview(view) }
    }
    
    @discardableResult
    func place(view: UIView, at index: Int) -> Self {
        modify { $0.insertSubview(view, at: index) }
    }
    
    @discardableResult
    func place(view: UIView, above subview: UIView) -> Self {
        modify { $0.insertSubview(view, aboveSubview: subview) }
    }
    
    @discardableResult
    func place(view: UIView, below subview: UIView) -> Self {
        modify { $0.insertSubview(view, belowSubview: subview) }
    }
    
    @discardableResult
    func remove(view: UIView) -> Self {
        modify { if $0 === view.superview { view.removeFromSuperview() }}
    }
    
    @discardableResult
    func removeView(below view: UIView) -> Self {
        guard let index = subviews.firstIndex(where: { $0 === view }) else { return self }
        return removeView(at: index - 1)
    }
    
    @discardableResult
    func removeView(above view: UIView) -> Self {
        guard let index = subviews.firstIndex(where: { $0 === view }) else { return self }
        return removeView(at: index + 1)
    }
    
    @discardableResult
    func removeView(at index: Int) -> Self {
        modify { $0.subviews[safe: index]?.removeFromSuperview() }
    }
    
    @discardableResult
    func removeSubviews() -> Self {
        modify { $0.subviews.forEach{ $0.removeFromSuperview() } }
    }
    
}
