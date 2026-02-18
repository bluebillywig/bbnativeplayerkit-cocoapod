
Pod::Spec.new do |spec|


  spec.name         = "BlueBillywigNativePlayerKit-iOS"
  spec.version          = '8.44.0'
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

  spec.dependency   'GoogleAds-IMA-iOS-SDK', '3.23.0'
  spec.dependency   'BlueBillywigNativeShared-iOS', '8.44.0'
  spec.dependency   'GoogleUserMessagingPlatform', '~> 2.1'

  spec.framework  = "UIKit", "Foundation", "AVFoundation"

  spec.default_subspec = :none

  spec.subspec 'GoogleCastSDK' do |google_cast_sdk|
    google_cast_sdk.dependency 'google-cast-sdk-dynamic-xcframework-ios-bb', '4.8.0'
  end

  spec.subspec 'GoogleCastSDKNoBluetooth' do |google_cast_sdk_no_bluetooth|
    google_cast_sdk_no_bluetooth.dependency 'google-cast-sdk-dynamic-xcframework-ios-no-bluetooth-bb', '4.8.0'
  end
end
