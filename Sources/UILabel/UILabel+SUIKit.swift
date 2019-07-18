//
//  UILabel+SUIKit.swift
//  Pods
//
//  Created by Maxim on 7/17/19.
//

import UIKit

// MARK: - Init
public extension UILabel {
    
    /// Initializes and returns a newly allocated label object with specified text, textAlignment, textColor and added subviews.
    ///
    /// The new view object must be inserted into the view hierarchy of a window before it can be used.
    ///
    /// - Parameter text: text of the label.
    /// - Parameter alignment: text alignment of the label.
    /// - Parameter color: text color of the label.
    /// - Parameter content: Closure, that specifies subviews to be added to the view hierarcy after initialization.
    convenience init(text: String? = nil, alignment: NSTextAlignment = .left, color: UIColor = .black, content: () -> UIView) {
        self.init(text: text, alignment: alignment, color: color)
        place(content: content)
    }
    
    /// Initializes and returns a newly allocated label object with specified text, textAlignment, and color.
    ///
    /// The new view object must be inserted into the view hierarchy of a window before it can be used.
    ///
    /// - Parameter text: text of the label.
    /// - Parameter alignment: text alignment of the label.
    /// - Parameter color: text color of the label.
    convenience init(text: String?, alignment: NSTextAlignment = .left, color: UIColor = .black) {
        self.init()
        self.text(text)
            .text(color: color)
            .text(alignment: alignment)
    }
    
}

// MARK: - Other
public extension UILabel {
    
    /// Provides a closure with the caller instance as a parameter.
    ///
    /// Use it to modify caller instance.
    ///
    /// Override this method in custom UILabel subclasses with your class modification parameter:
    ///
    /// ```(Class)->Void```
    ///
    /// to provide more convinient API.
    ///
    /// - Parameter modification: Closure that takes the caller instance as a parameter,
    /// - Returns: Caller instance.
    @discardableResult
    override func modify(_ modification: (UILabel)->Void) -> Self {
        modification(self)
        return self
    }
    
}

// MARK: - Text
public extension UILabel {
    
    @discardableResult
    func attributedText(_ text: NSAttributedString?) -> Self {
        modify{ $0.attributedText = text }
    }

    
    @discardableResult
    func text(_ text: String?, alignment: NSTextAlignment) -> Self {
        self.text(text)
            .text(alignment: alignment)
    }
    
    @discardableResult
    func text(_ text: String?, color: UIColor) -> Self {
        self.text(text)
            .text(color: color)
    }
    
    @discardableResult
    func text(_ text: String?) -> Self {
        modify { $0.text = text }
    }
    
    @discardableResult
    func text(color: UIColor) -> Self {
        modify { $0.textColor = color }
    }
    
    @discardableResult
    func highlightedText(color: UIColor) -> Self {
        modify { $0.highlightedTextColor = color }
    }
    
    @discardableResult
    func text(alignment: NSTextAlignment) -> Self {
        modify { $0.textAlignment = alignment }
    }
    
    @discardableResult
    func font(size: CGFloat, _ weight: UIFont.Weight = .regular) -> Self {
        self.font(UIFont.systemFont(ofSize: size, weight: weight))
    }
    
    @discardableResult
    func font(name: String, size: CGFloat) -> Self {
        modify { if let font = UIFont(name: name, size: size) { $0.font(font) }}
    }
    
    @discardableResult
    func font(descriptor: UIFontDescriptor, size: CGFloat) -> Self {
        modify { $0.font(UIFont(descriptor: descriptor, size: size)) }
    }
    
    @discardableResult
    func font(_ font: UIFont) -> Self {
        modify { $0.font = font }
    }
    
}
