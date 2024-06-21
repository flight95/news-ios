// swift-tools-version: 5.10

//
//  Package.swift
//  LibraryData-Remote-News
//
//  Created by Richard on 2024.06.19
//

import PackageDescription

let package = Package(
    name: "LibraryData-Remote-News",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "LibraryData-Remote-News", targets: ["LibraryData-Remote-News"]),
    ],
    dependencies: [
        .package(name: "LibraryDomain-Model-Core", path: "../LibraryDomain/Model/DomainModelCore"),
        .package(name: "LibraryDomain-Model-News", path: "../LibraryDomain/Model/DomainModelNews"),
        .package(name: "LibraryData-News", path: "../LibraryData/DataNews"),
        .package(name: "LibraryData-Remote-Core", path: "../LibraryData/Remote/DataRemoteCore"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.9.1")),
    ],
    targets: [
        .target(
            name: "LibraryData-Remote-News",
            dependencies: [
                .product(name: "LibraryDomain-Model-Core", package: "LibraryDomain-Model-Core"),
                .product(name: "LibraryDomain-Model-News", package: "LibraryDomain-Model-News"),
                .product(name: "LibraryData-News", package: "LibraryData-News"),
                .product(name: "LibraryData-Remote-Core", package: "LibraryData-Remote-Core"),
                .product(name: "AlamofireDynamic", package: "Alamofire")
            ]
        ),
    ]
)
