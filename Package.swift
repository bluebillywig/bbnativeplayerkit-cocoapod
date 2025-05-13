// swift-tools-version:5.8
import PackageDescription

let googleCastSdkUrl = "https://dl.google.com/dl/chromecast/sdk/ios/GoogleCastSDK-ios-4.8.0_dynamic_xcframework.zip"
let googleCastSdkChecksum = "4224724dc454b71eeab3debfe5c99e8a52ca9404d482f3b93c62e1c37be8dde4"

let package = Package(
    name: "BlueBillywigNativePlayerKit-iOS",
    platforms: [ .iOS(.v14) ],
    products: [
        .library(name: "BlueBillywigNativePlayerKit-iOS", targets: ["BBNativePlayerKitTargets"])
    ],
    dependencies: [
        .package(url: "https://github.com/bluebillywig/bbnativeshared-cocoapod", exact: "8.25.0"),
        .package(url: "https://github.com/googleads/swift-package-manager-google-interactive-media-ads-ios", exact: "3.19.1"),
        .package(url: "https://github.com/googleads/swift-package-manager-google-user-messaging-platform", from: "2.1.0")
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
