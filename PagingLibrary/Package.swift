// swift-tools-version: 5.10

//
//  Package.swift
//  PagingLibrary
//
//  Created by Richard on 2024.06.21
//

import PackageDescription

let package = Package(
    name: "PagingLibrary",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "PagingLibrary",
            targets: ["PagingLibrary"]),
    ],
    targets: [
        .target(name: "PagingLibrary"),
    ]
)
