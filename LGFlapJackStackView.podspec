#
# Be sure to run `pod lib lint LGFlapJackStackView.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "LGFlapJackStackView"
  s.version          = "0.1.0"
  s.summary          = "A view that supports horizontally stacked bar graphs. I call them Flap Jacks."
  s.description      = <<-DESC
                       A view that supports horizontally stacked bar graphs. I call them Flap Jacks
                       DESC
  s.homepage         = "https://github.com/lukegeiger/LGFlapJackStackView"
  s.license          = 'MIT'
  s.author           = { "Luke Geiger" => "lukejamesgeiger@gmail.com" }
  s.source           = { :git => "https://github.com/lukegeiger/LGFlapJackStackView.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/lukejgeiger'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'LGFlapJackStackView' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit'

end