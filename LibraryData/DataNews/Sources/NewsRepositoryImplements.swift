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
        cache: NewsCacheDataSource,
        remote: NewsRemoteDataSource
    ) -> NewsRepositoryImplements {
        return NewsRepositoryImplements(
            cache: cache,
            remote: remote
        )
    }
    
    private init(
        cache: NewsCacheDataSource,
        remote: NewsRemoteDataSource
    ) {
        _cache = cache
        _remote = remote
    }
    
    // MARK: - Constants and Variables.
    
    private let _cache: NewsCacheDataSource
    private let _remote: NewsRemoteDataSource
    
    // MARK: - Implements NewsRepository.
    
    public func set(
        model: NewsModel
    ) -> AnyPublisher<NewsModel?, Error> {
        return _cache.set(model: model)
            .receive(on: DispatchQueue.global(qos: .default))
            .eraseToAnyPublisher()
    }
    
    public func get(
        page: Int,
        size: Int
    ) -> AnyPublisher<PagingModel<NewsModel>, Error> {
        return _cache.get(page: page, size: size)
            .flatMapEmptyContents {
                self._remote.get(page: page, size: size)
                    .flatMap { paging -> AnyPublisher<PagingModel<NewsModel>, Error> in
                        self._cache.add(paging: paging)
                            .eraseToAnyPublisher()
                    }
                    .eraseToAnyPublisher()
            }
            .receive(on: DispatchQueue.global(qos: .default))
            .eraseToAnyPublisher()
    }
    
    public func remove() -> AnyPublisher<Bool, Error> {
        return _cache.remove()
            .receive(on: DispatchQueue.global(qos: .default))
            .eraseToAnyPublisher()
    }
}
