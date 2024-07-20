// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SharedUI",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "SharedUI",
            targets: ["SharedUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/nikolainobadi/NnSwiftUIKit", branch: "main")
    ],
    targets: [
        .target(
            name: "SharedUI",
            dependencies: [
                "NnSwiftUIKit"
            ],
            resources: [
                .process("Resources/SharedUI.xcassets")
            ]
        ),
    ]
)
