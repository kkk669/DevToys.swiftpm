// swift-tools-version: 5.9

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription

let package = Package(
    name: "DevToys.swiftpm",
    platforms: [
        .iOS("17.0")
    ],
    products: [],
    dependencies: [
        .package(url: "https://github.com/kkk669/swift-log-playground", "0.1.4"..<"0.2.0"),
        .package(url: "https://github.com/luin/SwiftJSONFormatter", "2.0.0"..<"2.1.0"),
        .package(url: "https://github.com/auth0/JWTDecode.swift", "3.1.0"..<"3.2.0"),
        .package(url: "https://github.com/kkk669/swift-html-entities", branch: "origin/issues/67"),
        .package(url: "https://github.com/Losiowaty/PlaygroundTester", "0.3.1"..<"0.4.0"),
        .package(url: "https://github.com/lukaskubanek/LoremSwiftum", "2.2.1"..<"2.3.0"),
        .package(url: "https://github.com/JohnSundell/Ink", "0.6.0"..<"0.7.0"),
        .package(url: "https://github.com/kkk669/swift-uniyaml", branch: "origin/issues/1"),
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
                .product(name: "UniYAML", package: "swift-uniyaml"),
            ],
            swiftSettings: [
                .unsafeFlags(["-Xfrontend", "-warn-long-function-bodies=100"], .when(configuration: .debug)),
                .unsafeFlags(["-Xfrontend", "-warn-long-expression-type-checking=100"], .when(configuration: .debug)),
                .unsafeFlags(["-Xfrontend", "-strict-concurrency=complete"]),
                .unsafeFlags(["-Xfrontend", "-enable-actor-data-race-checks"]),
                .define("DEBUG", .when(configuration: .debug)),
                .define("TESTING_ENABLED", .when(configuration: .debug)),
                .enableUpcomingFeature("BareSlashRegexLiterals"),
                .enableUpcomingFeature("ExistentialAny"),
            ]
        )
    ]
)

#if canImport(AppleProductTypes)
    import AppleProductTypes

    package.products += [
        .iOSApplication(
            name: "DevToys",
            targets: ["DevToysApp"],
            bundleIdentifier: "xyz.kebo.DevToysForiPad",
            teamIdentifier: "X4678G5DL2",
            displayVersion: "1.0.0",
            bundleVersion: "15",
            appIcon: .asset("AppIcon"),
            accentColor: .presetColor(.purple),
            supportedDeviceFamilies: [
                .pad,
                .phone,
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad])),
            ],
            appCategory: .developerTools,
            additionalInfoPlistContentFilePath: "Info.plist"
        )
    ]
#endif
