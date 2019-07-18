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
    
    convenience init(content: () -> UIView) {
        self.init()
        appendSubview(content)
    }
    
}

//MARK: - Other
public extension UIView {
    
    @discardableResult
    func link<T: UIView>(to view: inout T?) -> Self {
        modify{ if let self = $0 as? T { view = self }}
    }
    
    @discardableResult
    @objc func modify(_ modification: (UIView)->Void) -> Self {
        modification(self)
        return self
    }
    
}

// MARK: - Colors
public extension UIView {
    
    @discardableResult
    func alpha(_ value: CGFloat) -> Self {
        modify { $0.alpha = value }
    }
    
    @discardableResult
    func background(color: UIColor?) -> Self {
        modify { $0.backgroundColor = color }
    }
    
    @discardableResult
    func tint(color: UIColor) -> Self {
        modify { $0.tintColor = color }
    }

}

// MARK: - Corners
public extension UIView {
    
    @discardableResult
    func cornerRadius(_ value: CGFloat, corners: CACornerMask.Corner...) -> Self {
        cornerRadius(value, corners: Set(corners))
    }
    
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
    func appendSubview(_ content: ()->UIView) -> Self {
        appendSubview(content())
    }
    
    @discardableResult
    func appendSubview(_ content: ()->UIView, at index: Int) -> Self {
        appendSubview(content(), at: index)
    }
    
    @discardableResult
    func appendSubview(_ content: ()->UIView, above subview: UIView) -> Self {
        appendSubview(content(), above: subview)
    }
    
    @discardableResult
    func appendSubview(_ content: ()->UIView, below subview: UIView) -> Self {
        appendSubview(content(), below: subview)
    }
    
    @discardableResult
    func appendSubview(_ view: UIView) -> Self {
        modify { $0.addSubview(view) }
    }
    
    @discardableResult
    func appendSubview(_ view: UIView, at index: Int) -> Self {
        modify { $0.insertSubview(view, at: index) }
    }
    
    @discardableResult
    func appendSubview(_ view: UIView, above subview: UIView) -> Self {
        modify { $0.insertSubview(view, aboveSubview: subview) }
    }
    
    @discardableResult
    func appendSubview(_ view: UIView, below subview: UIView) -> Self {
        modify { $0.insertSubview(view, belowSubview: subview) }
    }
    
    @discardableResult
    func removeSubview(_ view: UIView) -> Self {
        modify { if $0 === view.superview { view.removeFromSuperview() }}
    }
    
    @discardableResult
    func removeSubview(below view: UIView) -> Self {
        guard let index = subviews.firstIndex(where: { $0 === view }) else { return self }
        return removeSubview(at: index - 1)
    }
    
    @discardableResult
    func removeSubview(above view: UIView) -> Self {
        guard let index = subviews.firstIndex(where: { $0 === view }) else { return self }
        return removeSubview(at: index + 1)
    }
    
    @discardableResult
    func removeSubview(at index: Int) -> Self {
        modify { $0.subviews[safe: index]?.removeFromSuperview() }
    }
    
}