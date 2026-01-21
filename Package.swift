// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SygicMaps",
    platforms: [
        .iOS(.v12)
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
            url: "https://public.repo.sygic.com/repository/maven-sygic-coretech-private/com/sygic/sdk/maps-ios/32.2.0-dev.166/maps-ios-32.2.0-dev.166.zip",
            checksum: "75fafc0b9669b8450e5ead60b7418923f5e8fd899c126a5c87f93d625af1f1eb"
        )
    ]
)
