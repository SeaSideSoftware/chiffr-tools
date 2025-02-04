// swift-tools-version:5.7


import PackageDescription

let package = Package(
    name: "chiffr-tools",
    platforms: [
        .iOS(.v16),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "ChiffrTools",
            targets: ["ChiffrTools"]),
    ],
    dependencies: [
        .package(url: "https://github.com/nixberg/chacha-rng-swift", .upToNextMinor(from: "0.8.1"))
    ],
    targets: [
        .target(
            name: "ChiffrTools",
        dependencies: [
            .product(name: "ChaChaRNG", package: "chacha-rng-swift"),
        ]),
        .testTarget(
            name: "ChiffrToolsTests",
            dependencies: ["ChiffrTools"]
        ),
    ]
)
