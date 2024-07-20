// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iCleanMeSharedUI",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "iCleanMeSharedUI",
            targets: ["iCleanMeSharedUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/nikolainobadi/NnSwiftUIKit", branch: "main")
    ],
    targets: [
        .target(
            name: "iCleanMeSharedUI",
            dependencies: [
                "NnSwiftUIKit"
            ],
            resources: [
                .process("Resources/SharedUI.xcassets")
            ]
        ),
    ]
)
