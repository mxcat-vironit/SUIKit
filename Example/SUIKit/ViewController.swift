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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setup()
        //greetings()
    }
    
    func setup() {
        var top = 200
        ["Hello", "SUIKit", "What's", "Up?",
         "––––––––––––––––––––––––––––––––",
         "I'm", "fine", "thanx", "and you?",
         "––––––––––––––––––––––––––––––––",
         "Just awesome"].forEach { item in
            view.place {
                UILabel(text: item, alignment: .center, color: .red)
                    .frame(x: 0, y: top, width: Int(view.frame.width), height: 40)
            }
            top += 40
        }
        
//        view.place {
//            UIView {
//                UIView()
//                    .background(color: #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1))
//                    .center(view.center)
//                    .size(width: 240, height: 480)
//                    .cornerRadius(48, corners: .excluding(.bottomLeft))
//            }.place {
//                UILabel(text: "Hello, SUIKit!", alignment: .center, color: .red)
//                    .font(size: 24, .semibold)
//                    .frame(view.frame)
//                    .link(to: &label)
//            }
//            .frame(view.frame)
//            .background(color: .black)
//            .cornerRadius(view.frame.width / 2, corners: .tlbr)
//        }
//        .background(color: .red)
    }
    
    func greetings() {
        if counter < 10 { counter.isMultiple(of: 2) ? greetUser() : greetSUIKit() }
    }
    
    func greetUser() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) { [weak self] in
            guard let self = self else { return }
            self.counter += 1
            self.label?.text("Hi, User!", color: .yellow)
            self.view.background(color: .yellow)
            self.greetings()
        }
    }
    
    func greetSUIKit() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) { [weak self] in
            guard let self = self else { return }
            self.counter += 1
            self.label?.text("Hello, SUIKit!", color: .red)
            self.view.background(color: .red)
            self.greetings()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
