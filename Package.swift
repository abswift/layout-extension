// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "LayoutExtension",
    platforms: [
        .iOS(.v9),
    ],
    products: [
        .library(name: "LayoutExtension",
                 targets: ["LayoutExtension"]),
    ],
    targets: [
        .target(name: "LayoutExtension",
                path: "LayoutExtension/Classes"),
    ],
    swiftLanguageVersions: [.v5]
)
