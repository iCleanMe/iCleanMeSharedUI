// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iCleanMeSharedUI",
    platforms: [
        .iOS(.v17), .macOS(.v13)
    ],
    products: [
        .library(
            name: "iCleanMeSharedUI",
//            type: .dynamic,
            targets: ["iCleanMeSharedUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/nikolainobadi/NnSwiftUIKit", from: "1.0.0")
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
