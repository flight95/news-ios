// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LibraryData-Remote-News",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "LibraryData-Remote-News",
            targets: ["LibraryData-Remote-News"]),
    ],
    dependencies: [
        .package(name: "LibraryData-News", path: "../LibraryData/DataNews"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "LibraryData-Remote-News",
            dependencies: [
                .product(name: "LibraryData-News", package: "LibraryData-News"),
            ]
        ),
    ]
)
