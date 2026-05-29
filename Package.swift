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
            url: "https://public.repo.sygic.com/repository/maven-sygic-coretech-private/com/sygic/sdk/maps-ios/36.1.0-dev.375/maps-ios-36.1.0-dev.375.zip",
            checksum: "3fb19953553f96952e9813941337584ed72944c3f35ad56dea94086cbd9a459e"
        )
    ]
)
