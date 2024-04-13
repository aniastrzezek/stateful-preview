// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "stateful-preview",
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
