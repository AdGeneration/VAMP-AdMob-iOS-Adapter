// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VAMP-AdMob-iOS-Adapter",
    platforms: [
        .iOS(.v13)
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
            exact: "13.6.0"
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
                      url: "https://d2dylwb3shzel1.cloudfront.net/iOS/VAMPAdMobAdapter-v13.6.0.zip",
                      checksum: "69e68caa2463f9aefac2f25e9dcc0c23f8427fef1340756044d6fdc5803828b8")
    ]
)
