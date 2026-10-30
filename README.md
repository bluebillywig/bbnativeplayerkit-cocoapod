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

### Swift Package Manager

1. In Xcode, go to **File > Add Package Dependencies** and enter:

   ```
   https://github.com/bluebillywig/bbnativeplayerkit-cocoapod
   ```

2. Set **Dependency Rule** to **Exact Version** and enter 8.63.0 or a later version. A new SDK version can contain breaking changes even when only the middle number goes up.
3. Click **Add Package** and pick one product. Set **Add to Target** to your app target for that product, and to **None** for the other one.

The package has two library products:

- `BlueBillywigNativePlayerKit-iOS`: Google Cast with Bluetooth.
- `BlueBillywigNativePlayerKit-iOS-NoBluetooth`: Google Cast without Bluetooth. Casting works over the local network and `NSBluetoothAlwaysUsageDescription` is not needed.

Add exactly one product, never both. Each one embeds its own `GoogleCast.framework`. Pinned to a `<version>-no-bluetooth` branch? Switch to the `-NoBluetooth` product with Exact Version 8.63.0 or later. The package brings the shared module, Google IMA, Google User Messaging Platform and Google Cast, so you do not add those yourself.

For the full steps, see the [Getting Started guide](https://bluebillywig.github.io/bbnativeplayersdk/ios_documentation/Getting%20Started/GettingStarted.html).

> **CocoaPods:** version 8.64 is the last version on CocoaPods and gets no further updates. Move to Swift Package Manager; [the migration guide](https://support.bluebillywig.com/native-sdk/ios-sdk-cocoapods-to-swift-package-manager/) has the steps.

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
