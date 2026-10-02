// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VAMP-AdMob-iOS-Adapter",
    platforms: [
        .iOS(.v15)
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
            exact: "13.11.0"
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
                      url: "https://github.com/AdGeneration/VAMP-AdMob-iOS-Adapter/releases/download/13.11.0/VAMPAdMobAdapter-v13.11.0.zip",
                      checksum: "d451b9c926fe1dc90fdd9bdfdb401e1890caf1ac2faff41a96f04b4888d821fa")
    ]
)
