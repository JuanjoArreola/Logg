// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "Logg",
    products: [
        .library(
            name: "Logg",
            targets: ["Logg"]
        )
    ],
    dependencies: [],
    targets: [
        .target(name: "Logg", dependencies: []),
        .testTarget(name: "LoggTests", dependencies: ["Logg"])
    ]
)
