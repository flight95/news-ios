// swift-tools-version: 5.10

//
//  Package.swift
//  LibraryDomain-News
//
//  Created by Richard on 2024.06.18
//

import PackageDescription

let package = Package(
    name: "LibraryDomain-News",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "LibraryDomain-News", targets: ["LibraryDomain-News"]),
    ],
    dependencies: [
        .package(name: "LibraryDomain-Model-Core", path: "../LibraryDomain/Model/DomainModelCore"),
        .package(name: "LibraryDomain-Model-News", path: "../LibraryDomain/Model/DomainModelNews"),
    ],
    targets: [
        .target(
            name: "LibraryDomain-News",
            dependencies: [
                .product(name: "LibraryDomain-Model-Core", package: "LibraryDomain-Model-Core"),
                .product(name: "LibraryDomain-Model-News", package: "LibraryDomain-Model-News"),
            ]
        ),
    ]
)
