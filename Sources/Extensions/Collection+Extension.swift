//
//  Collection+Extension.swift
//  Pods-SUIKit_Example
//
//  Created by Maxim on 7/17/19.
//

import Foundation

extension MutableCollection {
    subscript(safe index: Self.Index) -> Element? {
        guard indices.contains(index) else { return nil }
        return self[index]
    }
}

extension Collection {
    var lastIndex: Int? { count > 0 ? count - 1 : .none }
}
