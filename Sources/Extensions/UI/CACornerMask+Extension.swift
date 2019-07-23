//
//  CACornerMask+Extension.swift
//  Pods-SUIKit_Example
//
//  Created by Maxim on 7/17/19.
//

public extension CACornerMask {
    typealias Corners = Set<Corner>
    
    enum Corner: UInt {
        case topLeft = 1
        case topRight = 2
        case bottomLeft = 4
        case bottomRight = 8
    }
    
}

public extension Array where Element == CACornerMask.Corner {
    
    var makeCornerMask: CACornerMask { Set(self).makeCornerMask }
    
    var maskValue: UInt { Set(self).maskValue }
    
}

public extension Set where Element == CACornerMask.Corner {
    
    var makeCornerMask: CACornerMask { CACornerMask(rawValue: maskValue) }
    
    var maskValue: UInt {
        var value: UInt = 0
        forEach { value += $0.rawValue }
        return value
    }
    
    static var top: Set<Element> { [.topLeft, .topRight] }
    
    static var bottom: Set<Element> { [.bottomLeft, .bottomRight] }
    
    static var left: Set<Element> { [.topLeft, .bottomLeft] }
    
    static var right: Set<Element> { [.topRight, .bottomRight] }
    
    static var tlbr: Set<Element> { [.topLeft, .bottomRight] }
    
    static var trbl: Set<Element> { [.topRight, .bottomLeft] }
    
    static var all: Set<Element> { [.topLeft, .topRight, .bottomLeft, .bottomRight] }
    
    static var none: Set<Element> { [] }
    
    static func mask(_ corners: Element...) -> CACornerMask { corners.makeCornerMask }
    
    static func mask(_ corners: Set<Element>) -> CACornerMask { corners.makeCornerMask }
    
    static func excluding(_ corners: Element...) -> Set<Element> { excluding(Set(corners)) }
    
    static func excluding(_ corners: Set<Element>) -> Set<Element> { all.filter{ !corners.contains($0) }}
    
}

public extension CACornerMask {
    init(_ corners: Corner...) { self = corners.makeCornerMask }
    init(_ corners: Corners ) { self = corners.makeCornerMask }
}
