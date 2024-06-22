// swift-tools-version: 5.10

//
//  Package.swift
//  NewsView-News
//
//  Created by Richard on 2024.06.23
//

import PackageDescription

let package = Package(
    name: "NewsView-News",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "NewsView-News", targets: ["NewsView-News"]),
    ],
    dependencies: [
        .package(name: "LibraryDomain-Model-Core", path: "../LibraryDomain/Model/DomainModelCore"),
        .package(name: "LibraryDomain-Model-News", path: "../LibraryDomain/Model/DomainModelNews"),
        .package(name: "NewsView-Core", path: "../NewsView/ViewCore"),
    ],
    targets: [
        .target(
            name: "NewsView-News",
            dependencies: [
                .product(name: "LibraryDomain-Model-Core", package: "LibraryDomain-Model-Core"),
                .product(name: "LibraryDomain-Model-News", package: "LibraryDomain-Model-News"),
                .product(name: "NewsView-Core", package: "NewsView-Core"),
            ]
        ),
    ]
)
