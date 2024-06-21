// swift-tools-version: 5.10

//
//  Package.swift
//  LibraryData-News
//
//  Created by Richard on 2024.06.19
//

import PackageDescription

let package = Package(
    name: "LibraryData-News",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "LibraryData-News", targets: ["LibraryData-News"]),
    ],
    dependencies: [
        .package(name: "LibraryDomain-Model-Core", path: "../LibraryDomain/Model/DomainModelCore"),
        .package(name: "LibraryDomain-Model-News", path: "../LibraryDomain/Model/DomainModelNews"),
        .package(name: "LibraryDomain-News", path: "../LibraryDomain/DomainNews"),
    ],
    targets: [
        .target(
            name: "LibraryData-News",
            dependencies: [
                .product(name: "LibraryDomain-Model-Core", package: "LibraryDomain-Model-Core"),
                .product(name: "LibraryDomain-Model-News", package: "LibraryDomain-Model-News"),
                .product(name: "LibraryDomain-News", package: "LibraryDomain-News"),
            ]
        ),
    ]
)
