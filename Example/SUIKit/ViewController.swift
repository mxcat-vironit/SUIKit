//
//  ViewController.swift
//  SUIKit
//
//  Created by mx-Cat on 07/18/2019.
//  Copyright (c) 2019 mx-Cat. All rights reserved.
//

import SUIKit

class ViewController: UIViewController {
    
    var label: UILabel?
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.appendSubview {
            UIView {
                UILabel(text: "Hello, SUIKit!", alignment: .center, color: .red)
                    .frame(view.frame)
                    .link(to: &label)
                }
                .frame(view.frame)
                .background(color: .black)
                .cornerRadius(300, corners: .tlbr)
            }
            .background(color: .red)
        
        hiuser()
    }
    
    func hiuser() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) { [weak self] in
            guard let self = self else { return }
            self.counter += 1
            self.label?.text("Hi, User!", color: .yellow)
            self.view.background(color: .yellow)
            self.hisuikit()
        }
    }
    
    func hisuikit() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) { [weak self] in
            guard let self = self else { return }
            self.counter += 1
            self.label?.text("Hello, SUIKit!", color: .red)
            self.view.background(color: .red)
            if self.counter < 10 { self.hiuser() }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
