// swift-tools-version: 5.10

//
//  Package.swift
//  LibraryDomain-Model-Core
//
//  Created by Richard on 2024.06.20
//

import PackageDescription

let package = Package(
    name: "LibraryDomain-Model-Core",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "LibraryDomain-Model-Core", targets: ["LibraryDomain-Model-Core"]),
    ],
    targets: [
        .target(name: "LibraryDomain-Model-Core"),
    ]
)
