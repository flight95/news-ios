// swift-tools-version: 5.10

//
//  Package.swift
//  NewsPresenter-Home
//
//  Created by Richard on 2024.06.19
//

import PackageDescription

let package = Package(
    name: "NewsPresenter-Home",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "NewsPresenter-Home", targets: ["NewsPresenter-Home"]),
    ],
    dependencies: [
        .package(name: "PagingLibrary", path: "PagingLibrary"),
        .package(name: "LibraryDomain-Model-Core", path: "../LibraryDomain/Model/DomainModelCore"),
        .package(name: "LibraryDomain-Model-News", path: "../LibraryDomain/Model/DomainModelNews"),
        .package(name: "LibraryDomain-News", path: "../LibraryDomain/DomainNews"),
        .package(name: "LibraryData-News", path: "../LibraryData/DataNews"),
        .package(name: "LibraryData-Remote-News", path: "../LibraryData/Remote/DataRemoteNews"),
    ],
    targets: [
        .target(
            name: "NewsPresenter-Home",
            dependencies: [
                .product(name: "PagingLibrary", package: "PagingLibrary"),
                .product(name: "LibraryDomain-Model-Core", package: "LibraryDomain-Model-Core"),
                .product(name: "LibraryDomain-Model-News", package: "LibraryDomain-Model-News"),
                .product(name: "LibraryDomain-News", package: "LibraryDomain-News"),
                .product(name: "LibraryData-News", package: "LibraryData-News"),
                .product(name: "LibraryData-Remote-News", package: "LibraryData-Remote-News"),
            ]
        ),
    ]
)
