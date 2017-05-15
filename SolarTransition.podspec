#
# Be sure to run `pod lib lint SolarTransition.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SolarTransition'
  s.version          = '0.1.0'
  s.summary          = 'Circular animated transition from UIButton.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
SolarTransition is a cocoapod for circular animated transition from UIButton which is a square shape with rounded corners by half of its width or height.
                       DESC

  s.homepage         = 'https://github.com/MatijaKruljac/SolarTransition'
  s.screenshots     = 'https://raw.githubusercontent.com/MatijaKruljac/SolarTransition/master/solartransition.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Matija Kruljac' => 'kruljac.matija@gmail.com' }
  s.source           = { :git => 'https://github.com/MatijaKruljac/SolarTransition.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SolarTransition/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SolarTransition' => ['SolarTransition/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
