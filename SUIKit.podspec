#
# Be sure to run `pod lib lint SUIKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SUIKit'
  s.version          = '0.1.0'
  s.summary          = 'Declarative UI framework'

  s.description      = <<-DESC
  Declarative UI framework, based on UIKit.
  Keywords: UIKit, Foundation, SwiftUI, Interface, Declarative, UI, Swift, Cocoapods.
                       DESC

  s.homepage         = 'https://github.com/mx-Cat/SUIKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mx-Cat' => 'id.maximkrouk@gmail.com' }
  s.source           = { :git => 'https://github.com/mx-Cat/SUIKit.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/mxcat_'

  s.ios.deployment_target = '11.0'

  s.source_files = 'Sources/**/*'
  s.frameworks = 'UIKit', 'Foundation'
end
