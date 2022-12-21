// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "FlippShopperSDK",
    products: [
        .library(
            name: "FlippShopperSDK",
            targets: ["FlippShopperSDK"]),
    ],
    dependencies: [
    ],
    targets: [
        .binaryTarget(
            name: "FlippShopperSDK",
            path: "Frameworks/FlippShopperSDK.xcframework"
        )
    ]
)
