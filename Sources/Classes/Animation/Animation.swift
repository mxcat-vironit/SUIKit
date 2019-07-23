//
//  Animation.swift
//  Pods-SUIKit_Example
//
//  Created by Maxim on 7/22/19.
//

public struct Animation {
    public enum Mode {
        case sequence
        case parallel
    }
    
    public let duration: TimeInterval
    public let delay: TimeInterval
    public let options: UIView.AnimationOptions
    public let operations: (UIView) -> Void
    public let completion: ((Bool) -> Void)?
    
    init(duration: TimeInterval = 0.3,
         delay: TimeInterval = 0,
         options: UIView.AnimationOptions = .init(),
         operations: @escaping (UIView) -> Void,
         completion: ((Bool) -> Void)? = nil)
    {
        self.duration = duration
        self.delay = delay
        self.options = options
        self.operations = operations
        self.completion = completion
    }
}

