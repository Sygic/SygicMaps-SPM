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
            url: "https://public.repo.sygic.com/repository/maven-sygic-coretech-private/com/sygic/sdk/maps-ios/41.6.0-dev.567/maps-ios-41.6.0-dev.567.zip",
            checksum: "10cbe15ee094c96cddd51f82533d0f5dfdc43ec5b605866423a3b25721fd8572"
        )
    ]
)
