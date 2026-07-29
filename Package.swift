// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SygicMaps",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "SygicMaps",
            targets: ["SygicMapsDependencyWrapper", "SygicMaps"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Sygic/SygicAuth-SPM", from: "3.0.0")
    ],
    targets: [
        .target(
            // This target helps to provide dependencies for binary target.
            // Binary target cannot have dependencies itself, but target with source files can.
            // That's why we add a stub target with a stub source file and declare dependencies for it.
            name: "SygicMapsDependencyWrapper",
            dependencies: [
                .product(name: "SygicAuth", package: "SygicAuth-SPM")
            ]
        ),
        .binaryTarget(
            name: "SygicMaps",
            url: "https://public.repo.sygic.com/repository/maven-sygic-coretech-private/com/sygic/sdk/maps-ios/40.1.0-dev.483/maps-ios-40.1.0-dev.483.zip",
            checksum: "7a7ff2f06e6f3b701f0c5dda8082cf6782deb89f50b3c85c95afc1678e4c8bf4"
        )
    ]
)
