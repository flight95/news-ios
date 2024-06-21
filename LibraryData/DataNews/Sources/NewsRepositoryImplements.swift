//
//  NewsRepositoryImplements.swift
//  LibraryData-News
//
//  Created by Richard on 2024.06.19
//

import Foundation
import Combine
import LibraryDomain_Model_Core
import LibraryDomain_Model_News
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
    
    public func get(
        page: Int,
        size: Int
    ) -> AnyPublisher<PagingModel<NewsModel>, Error> {
        return self._remote.get(page: page, size: size)
            .receive(on: DispatchQueue.global(qos: .default))
            .eraseToAnyPublisher()
    }
}
