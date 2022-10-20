// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SimpleOAuth2",
    products: [
        .library(
            name: "SimpleOAuth2",
            targets: ["SimpleOAuth2"])
    ],
    targets: [
        .target(
            name: "SimpleOAuth2",
            dependencies: ["AFNetworking"]),
        .testTarget(
            name: "SimpleOAuth2Specs",
            dependencies: ["SimpleOAuth2"])
    ]
)
