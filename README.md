# SUIKit

[![CI Status](https://img.shields.io/travis/mx-Cat/SUIKit.svg?style=flat)](https://travis-ci.org/mx-Cat/SUIKit)[![Version](https://img.shields.io/cocoapods/v/SUIKit.svg?style=flat)](https://cocoapods.org/pods/SUIKit)[![License](https://img.shields.io/cocoapods/l/SUIKit.svg?style=flat)](https://cocoapods.org/pods/SUIKit)[![Platform](https://img.shields.io/cocoapods/p/SUIKit.svg?style=flat)](https://cocoapods.org/pods/SUIKit)

__SwiftUI-like declarative UIKit based framework.__

SwiftUI is still in beta and lacks a lot of useful features at the moment, so why won't you just use UIKit in a declarative way? Now you can.

## Usage

```swift
import SUIKit

class ViewController: UIViewController {

    var label: UILabel?
    
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
            .cornerRadius(300, corners: .top)
        }
        .background(color: .red)
    }
}
```

_(Documentation will be provided soon.)_

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

*Feel free to contribute or [communicate](https://twitter.com/mxcat_).*