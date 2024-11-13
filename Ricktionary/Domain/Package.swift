// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "UseCases",
            targets: ["UseCases"]
        ),
        .library(
            name: "RepositoryProtocol",
            targets: ["RepositoryProtocol"]
        ),
        .library(
            name: "Entities",
            targets: ["Entities"]
        ),
    ],
    targets: [
        .target(
            name: "UseCases"),
        .target(
            name: "RepositoryProtocol",
            dependencies: ["Entities"]
        ),
        .target(
            name: "Entities"),
        .testTarget(
            name: "DomainTests",
            dependencies: ["UseCases", "RepositoryProtocol", "Entities"]),
    ]
)
