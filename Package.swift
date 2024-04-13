// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StatefulPreview",
    platforms: [.iOS(.v15)], // TODO: check the rest of the platforms
    products: [
        .library(
            name: "StatefulPreview",
            targets: ["StatefulPreview"]),
    ],
    targets: [
        .target(name: "StatefulPreview")
    ]
)
