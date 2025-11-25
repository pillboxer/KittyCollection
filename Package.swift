// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KittyCollection",
	platforms: [.iOS(.v26)],
    products: [.library(name: "KittyCollection", targets: ["KittyCollection"]),],
	dependencies: [.package(name: "KittyCore", path: "../KittyCore")],
    targets: [
		.target(
			name: "KittyCollection",
			dependencies: [.product(name: "KittyCore", package: "KittyCore")]
		),
    ]
)
