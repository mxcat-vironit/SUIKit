//
//  UILabel+SUIKit.swift
//  Pods
//
//  Created by Maxim on 7/17/19.
//

import UIKit

// MARK: - Init
public extension UILabel {
    
    convenience init(text: String? = nil, alignment: NSTextAlignment = .left, color: UIColor = .black, content: () -> UIView) {
        self.init(text: text, alignment: alignment, color: color)
        place(content: content)
    }
    
    convenience init(text: String?, alignment: NSTextAlignment = .left, color: UIColor = .black) {
        self.init()
        self.text(text)
            .text(color: color)
            .text(alignment: alignment)
    }
    
}

// MARK: - Other
public extension UILabel {
    
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
