// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SygicMaps",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "SygicMaps",
            targets: ["SygicMapsDependencyWrapper", "SygicMaps"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Sygic/SygicAuth-SPM", from: "1.3.2")
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
            url: "https://public.repo.sygic.com/repository/maven-sygic-releases/com/sygic/sdk/maps-ios/25.7.0/maps-ios-25.7.0.zip",
            checksum: "beea6d283e6438f15fd47bce562ba5489c5a5bbd725310646e6e380cc393670e")
    ]
)
