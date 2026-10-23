// swift-tools-version:5.8
import PackageDescription

let googleCastSdkUrl = "https://dl.google.com/dl/chromecast/sdk/ios/GoogleCastSDK-ios-4.8.0_dynamic_xcframework.zip"
let googleCastSdkChecksum = "4224724dc454b71eeab3debfe5c99e8a52ca9404d482f3b93c62e1c37be8dde4"
// Bluetooth-free Google Cast build: casting works over the local network and the app needs no
// NSBluetoothAlwaysUsageDescription. Same API, drop-in for the standard build.
let googleCastSdkNoBluetoothUrl = "https://dl.google.com/dl/chromecast/sdk/ios/GoogleCastSDK-ios-no-bluetooth-4.8.0_dynamic_xcframework.zip"
let googleCastSdkNoBluetoothChecksum = "ae6db94f6fff7720bc28faac2f5dbd0b9c5af0215a1819c4682f7060f21eb1bb"

let package = Package(
    name: "BlueBillywigNativePlayerKit-iOS",
    platforms: [ .iOS(.v14) ],
    products: [
        .library(name: "BlueBillywigNativePlayerKit-iOS", targets: ["BBNativePlayerKitTargets"]),
        // Link ONE of the two products. Both carry GoogleCast.framework.
        .library(name: "BlueBillywigNativePlayerKit-iOS-NoBluetooth", targets: ["BBNativePlayerKitTargetsNoBluetooth"])
    ],
    dependencies: [
        .package(url: "https://github.com/bluebillywig/bbnativeshared-cocoapod", exact: "8.61.0"),
        .package(url: "https://github.com/googleads/swift-package-manager-google-interactive-media-ads-ios", exact: "3.23.0"),
        .package(url: "https://github.com/googleads/swift-package-manager-google-user-messaging-platform", "2.1.0"..<"3.0.0")
    ],
    targets: [
        .binaryTarget(
            name: "google-cast-sdk-ios",
            url: googleCastSdkUrl,
            checksum: googleCastSdkChecksum
        ),
        .binaryTarget(
            name: "google-cast-sdk-ios-no-bluetooth",
            url: googleCastSdkNoBluetoothUrl,
            checksum: googleCastSdkNoBluetoothChecksum
        ),
        .binaryTarget(
            name: "BBNativePlayerKit",
            path: "BBNativePlayerKit.xcframework"
        ),
        .target(
            name: "BBNativePlayerKitTargets",
            dependencies: [
                .product(name: "BlueBillywigNativeShared-iOS", package: "bbnativeshared-cocoapod"),
                .product(name: "GoogleInteractiveMediaAds", package: "swift-package-manager-google-interactive-media-ads-ios"),
                .product(name: "GoogleUserMessagingPlatform", package: "swift-package-manager-google-user-messaging-platform"),
                .target(name: "google-cast-sdk-ios"),
                .target(name: "BBNativePlayerKit")
            ]
        ),
        .target(
            name: "BBNativePlayerKitTargetsNoBluetooth",
            dependencies: [
                .product(name: "BlueBillywigNativeShared-iOS", package: "bbnativeshared-cocoapod"),
                .product(name: "GoogleInteractiveMediaAds", package: "swift-package-manager-google-interactive-media-ads-ios"),
                .product(name: "GoogleUserMessagingPlatform", package: "swift-package-manager-google-user-messaging-platform"),
                .target(name: "google-cast-sdk-ios-no-bluetooth"),
                .target(name: "BBNativePlayerKit")
            ]
        )
    ]
)
