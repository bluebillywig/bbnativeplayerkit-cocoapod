# BlueBillywigNativePlayerKit-iOS

The Blue Billywig Native Player Kit is an iOS SDK for playing video content from the [Blue Billywig](https://www.bluebillywig.com/) Online Video Platform. It provides native video playback with support for advertising (IMA), Chromecast, Picture-in-Picture, AirPlay, and Shorts (vertical video).

## Features

- Native video playback using AVFoundation
- Pre-roll, mid-roll, and post-roll advertising via Google IMA
- Chromecast support (with and without Bluetooth)
- Picture-in-Picture and AirPlay
- Vertical video / Shorts playback
- Renderer views for custom ad-focused layouts
- Outstream video support
- Full playback control API
- Event-driven delegate callbacks

## Requirements

- iOS 14.0+
- Swift 5+
- Xcode 15.0+

## Installation

### CocoaPods

Add the following to your `Podfile`:

```ruby
pod 'BlueBillywigNativePlayerKit-iOS'

# Chromecast is required — choose one:
pod 'BlueBillywigNativePlayerKit-iOS/GoogleCastSDK'            # With Bluetooth (guest mode)
pod 'BlueBillywigNativePlayerKit-iOS/GoogleCastSDKNoBluetooth'  # Without Bluetooth
```

Then run:

```bash
pod install --repo-update
```

### Swift Package Manager

In Xcode, go to **File > Add Package Dependencies** and enter:

```
https://github.com/bluebillywig/bbnativeplayerkit-cocoapod
```

> **Note:** Use the **Exact Version** dependency rule. The SDK does not follow strict semantic versioning, so "Up to Next Major" or "Up to Next Minor" may pull incompatible versions.
>
> For Chromecast without Bluetooth, use the **Branch** rule with `<version>-no-bluetooth` (e.g. `8.46.3-no-bluetooth`).

## Quick Start

```swift
import BBNativePlayerKit

let playerView = BBNativePlayer.createPlayerView(
	uiViewController: self,
	frame: view.frame,
	jsonUrl: "https://demo.bbvms.com/p/default/c/2431946.json"
)
view.addSubview(playerView)
```

For complete integration guides, API reference, and examples, see the [documentation](https://bluebillywig.github.io/bbnativeplayersdk/ios_documentation/Getting%20Started/GettingStarted.html).

## Documentation

- [Getting Started](https://bluebillywig.github.io/bbnativeplayersdk/ios_documentation/Getting%20Started/GettingStarted.html)
- [API Reference](https://bluebillywig.github.io/bbnativeplayersdk/ios/latest)
- [Demo App](https://github.com/bluebillywig/bbnativeplayerkit-demo)
- [Chromecast Integration](https://bluebillywig.github.io/bbnativeplayersdk/ios_documentation/Know%20How/How%20to%20enable%20ChromeCast.html)
- [Picture-in-Picture and AirPlay](https://bluebillywig.github.io/bbnativeplayersdk/ios_documentation/Know%20How/How%20to%20enable%20picture%20in%20picture%20and%20Airplay.html)
