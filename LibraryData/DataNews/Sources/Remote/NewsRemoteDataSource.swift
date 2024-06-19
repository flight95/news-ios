//
//  NewsRemoteDataSource.swift
//  LibraryData-News
//
//  Created by Richard on 2024.06.18
//

import Combine

public protocol NewsRemoteDataSource {
    
    func get() -> AnyPublisher<String, Error>
}
