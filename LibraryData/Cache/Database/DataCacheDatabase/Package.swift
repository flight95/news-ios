// swift-tools-version: 5.10

//
//  Package.swift
//  LibraryData-Cache-Database
//
//  Created by Richard on 2024.06.22
//

import PackageDescription

let package = Package(
    name: "LibraryData-Cache-Database",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "LibraryData-Cache-Database", targets: ["LibraryData-Cache-Database"]),
    ],
    dependencies: [
        .package(url: "https://github.com/realm/realm-swift.git", .upToNextMajor(from: "10.52.0")),
        .package(name: "LibraryDomain-Model-Core", path: "../LibraryDomain/Model/DomainModelCore"),
        .package(name: "LibraryData-Cache-DatabaseNews", path: "../LibraryData/Cache/Database/DataCacheDatabaseNews"),
    ],
    targets: [
        .target(
            name: "LibraryData-Cache-Database",
            dependencies: [
                .product(name: "RealmSwift", package: "realm-swift"),
                .product(name: "LibraryDomain-Model-Core", package: "LibraryDomain-Model-Core"),
                .product(name: "LibraryData-Cache-DatabaseNews", package: "LibraryData-Cache-DatabaseNews"),
            ]
        ),
    ]
)
