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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        view.ui.add {
            UIView {
                UIView {
                    UILabel(text: "1").ui
                        .frame(x: 0, y: 44, width: CGRect.screen.width, height: 20)
                        .link(to: &label)
                        .view
                    UILabel(text: "2").ui
                        .frame(x: 44, y: 88, width: CGRect.screen.width, height: 20)
                        .view
                }
                UILabel(text: "3").ui
                    .frame(x: 88, y: 132, width: CGRect.screen.width, height: 20)
                    .view
                UILabel(text: "4").ui
                    .frame(x: 132, y: 176, width: CGRect.screen.width, height: 20)
                    .view
                UILabel(text: "5").ui
                    .frame(x: 176, y: 220, width: CGRect.screen.width, height: 20)
                    .view
            }
            .ui
            .size(width: CGRect.screen.width, height: 100)
            .origin(x: 0, y: 0)
            .background(color: .red)
            .cornerRadius(18, corners: .bottom)
            .view
            UILabel(text: "6").ui
                .frame(x: 220, y: 264, width: CGRect.screen.width, height: 20)
                .view
            UILabel(text: "7").ui
                .frame(x: 264, y: 308, width: CGRect.screen.width, height: 20)
                .view
            UILabel(text: "8").ui
                .frame(x: 308, y: 352, width: CGRect.screen.width, height: 20)
                .view
        }
        .background(color: .yellow)
    }
    
}
