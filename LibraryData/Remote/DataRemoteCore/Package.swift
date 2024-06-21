// swift-tools-version: 5.10

//
//  Package.swift
//  LibraryData-Remote-Core
//
//  Created by Richard on 2024.06.20
//

import PackageDescription

let package = Package(
    name: "LibraryData-Remote-Core",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "LibraryData-Remote-Core", targets: ["LibraryData-Remote-Core"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.9.1")),
        .package(name: "LibraryDomain-Model-Core", path: "../LibraryDomain/Model/DomainModelCore"),
    ],
    targets: [
        .target(
            name: "LibraryData-Remote-Core",
            dependencies: [
                .product(name: "AlamofireDynamic", package: "Alamofire"),
                .product(name: "LibraryDomain-Model-Core", package: "LibraryDomain-Model-Core"),
            ]
        ),
    ]
)
