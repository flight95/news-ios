// swift-tools-version: 5.10

//
//  Package.swift
//  NewsView-Home
//
//  Created by Richard on 2024.06.18
//

import PackageDescription

let package = Package(
    name: "NewsView-Home",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "NewsView-Home", targets: ["NewsView-Home"]),
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "7.12.0")),
        .package(name: "PagingLibrary", path: "PagingLibrary"),
        .package(name: "LibraryDomain-Model-Core", path: "../LibraryDomain/Model/DomainModelCore"),
        .package(name: "LibraryDomain-Model-News", path: "../LibraryDomain/Model/DomainModelNews"),
        .package(name: "NewsView-Core", path: "../NewsView/ViewCore"),
        .package(name: "NewsPresenter-Home", path: "../NewsPresenter/HomePresenter"),
    ],
    targets: [
        .target(
            name: "NewsView-Home",
            dependencies: [
                .product(name: "Kingfisher", package: "Kingfisher"),
                .product(name: "PagingLibrary", package: "PagingLibrary"),
                .product(name: "LibraryDomain-Model-Core", package: "LibraryDomain-Model-Core"),
                .product(name: "LibraryDomain-Model-News", package: "LibraryDomain-Model-News"),
                .product(name: "NewsView-Core", package: "NewsView-Core"),
                .product(name: "NewsPresenter-Home", package: "NewsPresenter-Home"),
            ]
        ),
    ]
)
