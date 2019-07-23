//
//  ViewDSL+Animation.swift
//  Pods-SUIKit_Example
//
//  Created by Maxim on 7/22/19.
//

public extension SUIKit.ViewDSL {

    @discardableResult
    func animate(_ animations: Animation...) -> Self {
        animate(animations)
    }
    
    @discardableResult
    func animate(_ animations: [Animation]) -> Self {
        animate(.sequence, animations)
    }
    
    @discardableResult
    func animate(_ mode: Animation.Mode, _ animations: Animation...) -> Self {
        animate(mode, animations)
    }
    
    @discardableResult
    func animate(_ mode: Animation.Mode, _ animations: [Animation]) -> Self {
        modify {
            switch mode {
            case .parallel:
                animate(view: $0, animations: animations, inParallel: true)
            case .sequence:
                animate(view: $0, animations: animations, inParallel: false)
            }
        }
    }

}

fileprivate extension SUIKit.ViewDSL {
    func animate(view: UIView, animations: [Animation]) {
        guard !animations.isEmpty else { return }
        
        var animations = animations
        let animation = animations.removeFirst()
        
        UIView.animate(withDuration: animation.duration,
                       delay: animation.delay,
                       options: animation.options,
                       animations: { animation.operations(view) },
                       completion: {
                        animation.completion?($0)
                        self.animate(view: view, animations: animations)
        })
    }
    
    func animate(view: UIView, animations: [Animation], inParallel: Bool) {
        guard inParallel else {
            animate(view: view, animations: animations)
            return
        }
        
        animations.forEach { animation in
            UIView.animate(withDuration: animation.duration,
                           delay: animation.delay,
                           options: animation.options,
                           animations: { animation.operations(view) },
                           completion: animation.completion)
        }
    }
}

