//
//  UIViewBuilder.swift
//  Pods-SUIKit_Example
//
//  Created by Maxim on 7/22/19.
//

import SwiftUI

public extension SUIKit {
    @_functionBuilder
    struct UIViewBuilder {
        public typealias Block = ()->UIView
        
        public static func buildBlock(content: UIView...) -> UIView {
            let view = UIView()
            content.forEach{ view.ui.add(view: $0) }
            return view
        }
    }
}
