// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NewsView-Home",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "NewsView-Home",
            targets: ["NewsView-Home"]),
    ],
    dependencies: [
        .package(name: "NewsPresenter-Home", path: "../../HomePresenter")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "NewsView-Home",
            dependencies: [
                .product(name: "NewsPresenter-Home", package: "NewsPresenter-Home")
            ]
        ),
    ]
)
