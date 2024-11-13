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
        .library(
            name: "DomainMocks",
            targets: ["DomainMocks"]
        ),
    ],
    targets: [
        .target(
            name: "Entities"),
        .target(
            name: "UseCases",
            dependencies: ["Entities", "RepositoryProtocol"]
        ),
        .target(
            name: "RepositoryProtocol",
            dependencies: ["Entities"]
        ),
        .target(
            name: "DomainMocks",
            dependencies: ["UseCases", "RepositoryProtocol", "Entities"]
        ),
        .testTarget(
            name: "DomainTests",
            dependencies: ["UseCases", "RepositoryProtocol", "Entities"]),
    ]
)
