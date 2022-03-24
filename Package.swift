// swift-tools-version: 5.5

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "DevToys",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "DevToys",
            targets: ["DevToysApp"],
            displayVersion: "1.0",
            bundleVersion: "1",
            iconAssetName: "AppIcon",
            accentColorAssetName: "AccentColor",
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/kkk669/swift-log-playground", "0.1.0"..<"0.2.0"),
        .package(url: "https://github.com/luin/SwiftJSONFormatter", "1.0.0"..<"1.1.0"),
        .package(url: "https://github.com/auth0/JWTDecode.swift", "2.6.3"..<"2.7.0"),
        .package(url: "https://github.com/kkk669/swift-html-entities", "4.0.1"..<"4.1.0"),
        .package(url: "https://github.com/Losiowaty/PlaygroundTester", "0.2.0"..<"0.3.0")
    ],
    targets: [
        .executableTarget(
            name: "DevToysApp",
            dependencies: [
                .product(name: "LoggingPlayground", package: "swift-log-playground"),
                .product(name: "SwiftJSONFormatter", package: "SwiftJSONFormatter"),
                .product(name: "JWTDecode", package: "JWTDecode.swift"),
                .product(name: "HTMLEntities", package: "swift-html-entities"),
                .product(name: "PlaygroundTester", package: "PlaygroundTester")
            ],
            swiftSettings: [
                .unsafeFlags(["-Xfrontend", "-warn-long-function-bodies=100"], .when(configuration: .debug)),
                .unsafeFlags(["-Xfrontend", "-warn-long-expression-type-checking=100"], .when(configuration: .debug)),
                .unsafeFlags(["-Xfrontend", "-warn-concurrency"]),
                .unsafeFlags(["-Xfrontend", "-enable-actor-data-race-checks"]),
                .define("TESTING_ENABLED", .when(configuration: .debug))
            ]
        )
    ]
)
