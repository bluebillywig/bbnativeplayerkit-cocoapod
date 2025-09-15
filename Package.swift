// swift-tools-version:5.8
import PackageDescription

let googleCastSdkUrl = "https://dl.google.com/dl/chromecast/sdk/ios/GoogleCastSDK-ios-no-bluetooth-4.8.0_dynamic_xcframework.zip"
let googleCastSdkChecksum = "ae6db94f6fff7720bc28faac2f5dbd0b9c5af0215a1819c4682f7060f21eb1bb"

let package = Package(
    name: "BlueBillywigNativePlayerKit-iOS",
    platforms: [ .iOS(.v14) ],
    products: [
        .library(name: "BlueBillywigNativePlayerKit-iOS", targets: ["BBNativePlayerKitTargets"])
    ],
    dependencies: [
        .package(url: "https://github.com/bluebillywig/bbnativeshared-cocoapod", exact: "8.34.0"),
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
        )
    ]
)
