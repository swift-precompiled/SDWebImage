// swift-tools-version:5.9.0

import PackageDescription
import Foundation

let package = Package(
    name: "SDWebImage",
    platforms: [
        .macOS("10.11"),
        .iOS("9.0"),
        .tvOS("9.0"),
        .watchOS("2.0")
    ],
    products: [
        .library(
            name: "SDWebImage",
            targets: ["SDWebImage_PrecompiledProduct"]
        ),
        .library(
            name: "SDWebImageMapKit",
            targets: ["SDWebImageMapKit_PrecompiledProduct"]
        )
    ],
    targets: [
        .target(
            name: "SDWebImage",
            dependencies: ["SDWebImage_PrecompiledArchive"],
            path: "Sources/SDWebImage",
            sources: ["Empty.m"],
            publicHeadersPath: "include",
            packageAccess: false,
            cSettings: [.headerSearchPath("Core"), .headerSearchPath("Private")]
        ),
        .binaryTarget(
            name: "SDWebImage_PrecompiledArchive",
            url: "https://github.com/swift-precompiled/SDWebImage/releases/download/5.21.3/SDWebImage-a648d75f9635b2eeb789a0eb30e5e75ed97a51e1c1d12cd9d563429f2e8987b6.xcframework.zip",
            checksum: "a648d75f9635b2eeb789a0eb30e5e75ed97a51e1c1d12cd9d563429f2e8987b6"
        ),
        .target(
            name: "SDWebImageMapKit",
            dependencies: ["SDWebImageMapKit_PrecompiledArchive", "SDWebImage"],
            path: "Sources/SDWebImageMapKit",
            sources: ["Empty.m"],
            publicHeadersPath: "include",
            packageAccess: false
        ),
        .binaryTarget(
            name: "SDWebImageMapKit_PrecompiledArchive",
            url: "https://github.com/swift-precompiled/SDWebImage/releases/download/5.21.3/SDWebImageMapKit-f1c2e528e4fbf929495c1e1fb7f2bb33f4171e769acb38d3df01aa4be938033d.xcframework.zip",
            checksum: "f1c2e528e4fbf929495c1e1fb7f2bb33f4171e769acb38d3df01aa4be938033d"
        ),
        .target(
            name: "SDWebImage_PrecompiledProduct",
            dependencies: ["SDWebImage"]
        ),
        .target(
            name: "SDWebImageMapKit_PrecompiledProduct",
            dependencies: ["SDWebImageMapKit", "SDWebImage"]
        )
    ]
)