// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Data",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Repository",
            targets: ["Repository"]),
        .library(
            name: "Services",
            targets: ["Services"]),
    ],
    dependencies: [
        .package(name: "Domain", path: "../Domain")
    ],
    targets: [
        .target(
            name: "Repository",
            dependencies: [
                "Services",
                .product(name: "RepositoryProtocol", package: "Domain")
            ]
        ),
        .target(
            name: "Services",
            dependencies: [
                .product(name: "Entities", package: "Domain")
            ]
        ),
        
        .testTarget(
            name: "DataTests",
            dependencies: ["Repository", "Services"]),
    ]
)
