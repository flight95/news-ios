// swift-tools-version: 5.10

//
//  Package.swift
//  LibraryData-Cache-DatabaseNews
//
//  Created by Richard on 2024.06.22
//

import PackageDescription

let package = Package(
    name: "LibraryData-Cache-DatabaseNews",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "LibraryData-Cache-DatabaseNews", targets: ["LibraryData-Cache-DatabaseNews"]),
    ],
    dependencies: [
        .package(url: "https://github.com/realm/realm-swift.git", .upToNextMajor(from: "10.52.0")),
        .package(name: "LibraryDomain-Model-Core", path: "../LibraryDomain/Model/DomainModelCore"),
    ],
    targets: [
        .target(
            name: "LibraryData-Cache-DatabaseNews",
            dependencies: [
                .product(name: "RealmSwift", package: "realm-swift"),
                .product(name: "LibraryDomain-Model-Core", package: "LibraryDomain-Model-Core"),
            ]
        ),
    ]
)
