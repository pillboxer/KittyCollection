// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CollectionKitty",
	platforms: [.iOS(.v26)],
    products: [.library(name: "CollectionKitty", targets: ["CollectionKitty"]),],
    targets: [
        .target(name: "CollectionKitty"),
        .testTarget(name: "CollectionKittyTests", dependencies: ["CollectionKitty"]),
    ]
)
