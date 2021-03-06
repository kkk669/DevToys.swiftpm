// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription

#if canImport(AppleProductTypes)
    import AppleProductTypes

    let products: [Product] = [
        .iOSApplication(
            name: "DevToys",
            targets: ["DevToysApp"],
            bundleIdentifier: "xyz.kebo.DevToysForiPad",
            teamIdentifier: "X4678G5DL2",
            displayVersion: "1.0.0",
            bundleVersion: "6",
            appIcon: .asset("AppIcon"),
            accentColor: .presetColor(.purple),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ],
            appCategory: .developerTools,
            additionalInfoPlistContentFilePath: "Info.plist"
        )
    ]
#else
    let products: [Product] = []
#endif

let package = Package(
    name: "DevToys",
    platforms: [
        .iOS("15.2")
    ],
    products: products,
    dependencies: [
        .package(url: "https://github.com/kkk669/swift-log-playground", "0.1.0"..<"0.2.0"),
        .package(url: "https://github.com/luin/SwiftJSONFormatter", "1.0.0"..<"1.1.0"),
        .package(url: "https://github.com/auth0/JWTDecode.swift", "3.0.0"..<"3.1.0"),
        .package(url: "https://github.com/kkk669/swift-html-entities", "4.0.2"..<"4.1.0"),
        .package(url: "https://github.com/Losiowaty/PlaygroundTester", "0.2.1"..<"0.3.0"),
        .package(url: "https://github.com/lukaskubanek/LoremSwiftum", "2.2.1"..<"2.3.0"),
        .package(url: "https://github.com/JohnSundell/Ink", "0.5.1"..<"0.6.0"),
        .package(url: "https://github.com/siteline/SwiftUI-Introspect", "0.1.4"..<"0.2.0")
    ],
    targets: [
        .executableTarget(
            name: "DevToysApp",
            dependencies: [
                .product(name: "LoggingPlayground", package: "swift-log-playground"),
                .product(name: "SwiftJSONFormatter", package: "SwiftJSONFormatter"),
                .product(name: "JWTDecode", package: "JWTDecode.swift"),
                .product(name: "HTMLEntities", package: "swift-html-entities"),
                .product(name: "PlaygroundTester", package: "PlaygroundTester"),
                .product(name: "LoremSwiftum", package: "LoremSwiftum"),
                .product(name: "Ink", package: "Ink"),
                .product(name: "Introspect", package: "SwiftUI-Introspect")
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
