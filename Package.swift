// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Sourcery",
    platforms: [
       .macOS(.v10_11),
    ],
    products: [
        .library(name: "SourceryRuntime", targets: ["SourceryRuntime"]),
        .library(name: "SourceryFramework", targets: ["SourceryFramework"]),
    ],
    dependencies: [
        .package(name: "Commander", url: "https://github.com/kylef/Commander.git", .exact("0.9.1")),
        .package(name: "PathKit", url: "https://github.com/kylef/PathKit.git", from: "1.0.0"),
        .package(name: "SourceKitten", url: "https://github.com/jpsim/SourceKitten.git", from: "0.30.1"),
        .package(name: "StencilSwiftKit", url: "https://github.com/SwiftGen/StencilSwiftKit.git", from: "2.7.0"),
    ],
    targets: [
        .target(name: "SourceryRuntime"),
        .target(name: "SourceryUtils", dependencies: [
          "PathKit"
        ]),
        .target(name: "SourceryFramework", dependencies: [
          "PathKit",
          .product(name: "SourceKittenFramework", package: "SourceKitten"),
          "SourceryUtils",
          "SourceryRuntime"
        ]),
        .target(name: "TryCatch", path: "TryCatch"),
    ]
)
