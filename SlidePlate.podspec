#
# Be sure to run `pod lib lint SlidePlate.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SlidePlate'
  s.version          = '0.1.0'
  s.summary          = 'Simple lib for creating Sliding view with animations'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Swift library for creating container view with sliding animations
It will placed in edges of parent view.
You can chose what position and other pref.
                       DESC

  s.homepage         = 'https://github.com/SocialTermite/SlidePlate'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Konstantin Bondar' => 'bondar.k.dev@gmail.com' }
  s.source           = { :git => 'https://github.com/SocialTermite/SlidePlate.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SlidePlate/Classes/**/*'
  s.swift_version = '4.0'
  # s.resource_bundles = {
  #   'SlidePlate' => ['SlidePlate/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'SnapKit'
end
