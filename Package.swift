// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CollectionKitty",
	platforms: [.iOS(.v26)],
    products: [.library(name: "CollectionKitty", targets: ["CollectionKitty"]),],
	dependencies: [.package(name: "CoreKitty", path: "../CoreKitty")],
    targets: [
		.target(
			name: "CollectionKitty",
			dependencies: [.product(name: "CoreKitty", package: "CoreKitty")]
		),
        .testTarget(name: "CollectionKittyTests", dependencies: ["CollectionKitty"]),
    ]
)
