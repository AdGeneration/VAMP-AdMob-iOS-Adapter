// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VAMP-AdMob-iOS-Adapter",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "VAMPAdMobAdapter",
            targets: ["VAMPAdMobAdapterTarget"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/AdGeneration/VAMP-iOS-SDK",
            "5.3.2"..<"6.0.0"
        ),
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
            exact: "12.5.0"
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "VAMPAdMobAdapterTarget",
            dependencies: [
                .target(name: "VAMPAdMobAdapter"),
                .product(name: "VAMP", package: "VAMP-iOS-SDK"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
            ],
            path: "VAMPAdMobAdapterTarget"
        ),
        .binaryTarget(name: "VAMPAdMobAdapter",
                      url: "https://d2dylwb3shzel1.cloudfront.net/iOS/VAMPAdMobAdapter-v12.8.0.zip",
                      checksum: "f04de23b2be107146544c73e6828ba00e1dc6186150273c2cddfc677f5f9dfc9")
    ]
)
