// swift-tools-version: 5.10

//
//  Package.swift
//  NewsView-Core
//
//  Created by Richard on 2024.06.21
//

import PackageDescription

let package = Package(
    name: "NewsView-Core",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "NewsView-Core", targets: ["NewsView-Core"]),
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "7.12.0")),
        .package(name: "LibraryDomain-Model-Core", path: "../LibraryDomain/Model/DomainModelCore"),
        .package(name: "LibraryDomain-Model-News", path: "../LibraryDomain/Model/DomainModelNews"),
    ],
    targets: [
        .target(
            name: "NewsView-Core",
            dependencies: [
                .product(name: "Kingfisher", package: "Kingfisher"),
                .product(name: "LibraryDomain-Model-Core", package: "LibraryDomain-Model-Core"),
                .product(name: "LibraryDomain-Model-News", package: "LibraryDomain-Model-News"),
            ]
        ),
    ]
)
