// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NewsPresenter-Home",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "NewsPresenter-Home",
            targets: ["NewsPresenter-Home"]),
    ],
    dependencies: [
        .package(name: "LibraryDomain-News", path: "../LibraryDomain/DomainNews"),
        .package(name: "LibraryData-News", path: "../LibraryData/DataNews"),
        .package(name: "LibraryData-Remote-News", path: "../LibraryData/Remote/DataRemoteNews"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "NewsPresenter-Home",
            dependencies: [
                .product(name: "LibraryDomain-News", package: "LibraryDomain-News"),
                .product(name: "LibraryData-News", package: "LibraryData-News"),
                .product(name: "LibraryData-Remote-News", package: "LibraryData-Remote-News"),
            ]
        ),
    ]
)
