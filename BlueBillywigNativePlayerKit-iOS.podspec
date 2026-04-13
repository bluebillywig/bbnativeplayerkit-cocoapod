
Pod::Spec.new do |spec|


  spec.name         = "BlueBillywigNativePlayerKit-iOS"
  spec.version          = '8.48.0'
  spec.summary      = "iOS SDK for playing Blue Billywig video content with native playback"

  spec.description  = <<-DESC
  The Blue Billywig Native Player Kit is an iOS SDK for playing video content from
  the Blue Billywig Online Video Platform. It provides native AVFoundation-based
  playback with support for IMA advertising, Chromecast, Picture-in-Picture, AirPlay,
  vertical video (Shorts), and a full playback control API with event-driven delegates.
                   DESC

  spec.homepage     = "https://www.bluebillywig.com/"
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { "Blue Billywig" => "tech@bluebillywig.com" }
  spec.platform     = :ios, "12.0"


  spec.ios.deployment_target = '14.0'
  spec.ios.vendored_frameworks = 'BBNativePlayerKit.xcframework'
  spec.source       = { :git => "https://github.com/bluebillywig/bbnativeplayerkit-cocoapod.git", :tag => "#{spec.version}" }

  spec.dependency   'GoogleAds-IMA-iOS-SDK', '3.23.0'
  spec.dependency   'BlueBillywigNativeShared-iOS', '8.48.0'
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
