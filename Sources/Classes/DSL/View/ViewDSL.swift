//
//  File.swift
//  Pods-SUIKit_Example
//
//  Created by Maxim on 7/19/19.
//

public extension SUIKit {    
    class ViewDSL: NSObject {
        public var view: UIView
        init(_ content: UIView) {
            self.view = content
        }
    }
}

//MARK: - Other
public extension SUIKit.ViewDSL {
    
    /// Links the outer variable to the caller instance.
    ///
    /// Does nothing if caller instance is not castable to a variable type,
    /// otherwise erases outer variable and places the caller instance address into it.
    ///
    /// - Parameter ref: Outer variable, that will be linked to the caller instance.
    /// - Returns: Caller instance.
    @discardableResult
    func link<T: UIView>(to ref: inout T?) -> Self {
        modify{ if let view = $0 as? T { ref = view }}
    }
    
    /// Provides a closure with the caller instance as a parameter.
    ///
    /// Use it to modify caller instance.
    ///
    /// Override this method in custom UIView subclasses with your class modification parameter:
    ///
    /// ```(Class)->Void```
    ///
    /// to provide more convinient API.
    ///
    /// - Parameter modification: Closure that takes the caller instance as a parameter,
    /// - Returns: Caller instance.
    @discardableResult
    @objc func modify(_ modification: (UIView)->Void) -> Self {
        modification(view)
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
public extension SUIKit.ViewDSL {
    
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
public extension SUIKit.ViewDSL {
    
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
public extension SUIKit.ViewDSL {
    
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
public extension SUIKit.ViewDSL {
    
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
public extension SUIKit.ViewDSL {
    
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
public extension SUIKit.ViewDSL {
    
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
public extension SUIKit.ViewDSL {
    
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
public extension SUIKit.ViewDSL {
    
    @discardableResult
    func tapRecognizer(target: Any?, action: Selector?) -> Self {
        gestureRecognizer(UITapGestureRecognizer(target: target, action: action))
    }
    
    @discardableResult
    func panRecognizer(target: Any?, action: Selector?) -> Self {
        gestureRecognizer(UIPanGestureRecognizer(target: target, action: action))
    }
    
    @discardableResult
    func pressRecognizer(target: Any?, action: Selector?) -> Self {
        gestureRecognizer(UILongPressGestureRecognizer(target: target, action: action))
    }
    
    @discardableResult
    func swipeRecognizer(target: Any?, action: Selector?) -> Self {
        gestureRecognizer(UISwipeGestureRecognizer(target: target, action: action))
    }
    
    @discardableResult
    func pinchRecognizer(target: Any?, action: Selector?) -> Self {
        gestureRecognizer(UIPinchGestureRecognizer(target: target, action: action))
    }
    
    @discardableResult
    func rotationRecognizer(target: Any?, action: Selector?) -> Self {
        gestureRecognizer(UIRotationGestureRecognizer(target: target, action: action))
    }
    
    @discardableResult
    func tapRecognizer(action: Selector?) -> Self {
        gestureRecognizer(UITapGestureRecognizer(target: view, action: action))
    }
    
    @discardableResult
    func panRecognizer(action: Selector?) -> Self {
        gestureRecognizer(UIPanGestureRecognizer(target: view, action: action))
    }
    
    @discardableResult
    func pressRecognizer(action: Selector?) -> Self {
        gestureRecognizer(UILongPressGestureRecognizer(target: view, action: action))
    }
    
    @discardableResult
    func swipeRecognizer(action: Selector?) -> Self {
        gestureRecognizer(UISwipeGestureRecognizer(target: view, action: action))
    }
    
    @discardableResult
    func pinchRecognizer(action: Selector?) -> Self {
        gestureRecognizer(UIPinchGestureRecognizer(target: view, action: action))
    }
    
    @discardableResult
    func rotationRecognizer(action: Selector?) -> Self {
        gestureRecognizer(UIRotationGestureRecognizer(target: view, action: action))
    }
    
    @discardableResult
    func gestureRecognizer(_ recognizer: UIGestureRecognizer) -> Self {
        modify { $0.addGestureRecognizer(recognizer) }
    }
    
}

// MARK: - Subviews
public extension SUIKit.ViewDSL {
    
    @discardableResult
    func add(@SUIKit.UIViewBuilder content: SUIKit.UIViewBuilder.Block) -> Self {
        add(view: content())
    }
    
    @discardableResult
    func add(@SUIKit.UIViewBuilder content: SUIKit.UIViewBuilder.Block, at index: Int) -> Self {
        add(view: content(), at: index)
    }
    
    @discardableResult
    func add(@SUIKit.UIViewBuilder content: SUIKit.UIViewBuilder.Block, above subview: UIView) -> Self {
        add(view: content(), above: subview)
    }
    
    @discardableResult
    func add(@SUIKit.UIViewBuilder content: SUIKit.UIViewBuilder.Block, below subview: UIView) -> Self {
        add(view: content(), below: subview)
    }
    
    @discardableResult
    func add(view: UIView) -> Self {
        modify { $0.addSubview(view) }
    }
    
    @discardableResult
    func add(view: UIView, at index: Int) -> Self {
        modify { $0.insertSubview(view, at: index) }
    }
    
    @discardableResult
    func add(view: UIView, above subview: UIView) -> Self {
        modify { $0.insertSubview(view, aboveSubview: subview) }
    }
    
    @discardableResult
    func add(view: UIView, below subview: UIView) -> Self {
        modify { $0.insertSubview(view, belowSubview: subview) }
    }
    
    @discardableResult
    func remove(view: UIView) -> Self {
        modify { if $0 === view.superview { view.removeFromSuperview() }}
    }
    
    @discardableResult
    func removeView(below view: UIView) -> Self {
        guard let index = view.subviews.firstIndex(where: { $0 === view }) else { return self }
        return removeView(at: index - 1)
    }
    
    @discardableResult
    func removeView(above view: UIView) -> Self {
        guard let index = view.subviews.firstIndex(where: { $0 === view }) else { return self }
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

