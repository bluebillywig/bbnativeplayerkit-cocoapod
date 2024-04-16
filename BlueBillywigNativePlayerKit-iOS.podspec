
Pod::Spec.new do |spec|


  spec.name         = "BlueBillywigNativePlayerKit-iOS"
  spec.version      = "7.130.0"
  spec.summary      = "Blue Billywig native player kit"

  spec.description  = <<-DESC
  Blue Billywig native player kit is used to play Blue Billywig mediaclips using the native ios player
                   DESC

  spec.homepage     = "https://www.bluebillywig.com/"
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { "Blue Billywig" => "tech@bluebillywig.com" }
  spec.platform     = :ios, "12.0"


  spec.ios.deployment_target = '14.0'
  spec.ios.vendored_frameworks = 'BBNativePlayerKit.xcframework'
  spec.source       = { :git => "https://github.com/bluebillywig/bbnativeplayerkit-cocoapod.git", :tag => "#{spec.version}" }

  spec.dependency   'GoogleAds-IMA-iOS-SDK', '3.19.1'
  spec.dependency   'google-cast-sdk-dynamic-xcframework-ios-bb', '4.8.0'
  spec.dependency   'BlueBillywigNativeShared-iOS', '7.130.0'
  spec.dependency   'GoogleUserMessagingPlatform', '2.1.0'

  spec.framework  = "UIKit", "Foundation", "AVFoundation"
end
