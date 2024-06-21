// swift-tools-version: 5.10

//
//  Package.swift
//  LibraryDomain-Model-News
//
//  Created by Richard on 2024.06.20
//

import PackageDescription

let package = Package(
    name: "LibraryDomain-Model-News",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "LibraryDomain-Model-News", targets: ["LibraryDomain-Model-News"]),
    ],
    dependencies: [
        .package(name: "LibraryDomain-Model-Core", path: "../LibraryDomain/Model/DomainModelCore"),
    ],
    targets: [
        .target(
            name: "LibraryDomain-Model-News",
            dependencies: [
                .product(name: "LibraryDomain-Model-Core", package: "LibraryDomain-Model-Core"),
            ]
        ),
    ]
)
