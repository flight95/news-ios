//
//  NewsRepositoryImplements.swift
//  LibraryData-News
//
//  Created by Richard on 2024.06.19
//

import Foundation
import Combine
import LibraryDomain_News

public class NewsRepositoryImplements : NewsRepository {
    
    // MARK: - Instance functions.
    
    public static func getInstance(
        remote: NewsRemoteDataSource
    ) -> NewsRepositoryImplements {
        return NewsRepositoryImplements(
            remote: remote
        )
    }
    
    private init(
        remote: NewsRemoteDataSource
    ) {
        _remote = remote
    }
    
    // MARK: - Constants and Variables.
    
    private let _remote: NewsRemoteDataSource
    
    // MARK: - Implements GetNews.
    
    public func get() -> AnyPublisher<String, Error> {
        return self._remote.get()
            .receive(on: DispatchQueue.global(qos: .default))
            .map { result in
                print("NewsRepositoryImplements.map in \(Thread.current)")
                return result
            }
            .eraseToAnyPublisher()
    }
}
