# SUIKit 🍯

[![CI Status](https://img.shields.io/travis/mx-Cat/SUIKit.svg?style=flat)](https://travis-ci.org/mx-Cat/SUIKit)[![Version](https://img.shields.io/cocoapods/v/SUIKit.svg?style=flat)](https://cocoapods.org/pods/SUIKit)[![License](https://img.shields.io/cocoapods/l/SUIKit.svg?style=flat)](https://cocoapods.org/pods/SUIKit)[![Platform](https://img.shields.io/cocoapods/p/SUIKit.svg?style=flat)](https://cocoapods.org/pods/SUIKit)

__SwiftUI-like declarative UIKit based framework.__

SwiftUI is still in beta and lacks a lot of useful features at the moment, and doesn't support the older versions of iOS, so why won't you just use UIKit in a declarative way? Now you can.

## Usage

```swift
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

```

_(Working on new features and xcode docs)_

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- 📱	iOS 11.0+

## Installation

SUILayout is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'SUIKit'
```

and run `pod install` from the terminal.

## License

SUIKit is available under the MIT license. See the LICENSE file for more info.



------

*Feel free to contribute or [communicate](https://twitter.com/mxcat_). I'm open to your ideas.* 🌝