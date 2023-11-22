// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWRoundedSegmentedControl",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "WWRoundedSegmentedControl", targets: ["WWRoundedSegmentedControl"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "WWRoundedSegmentedControl", dependencies: []),
    ]
)
