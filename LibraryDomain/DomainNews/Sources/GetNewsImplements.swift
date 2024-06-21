//
//  GetNewsImplements.swift
//  LibraryDomain-News
//
//  Created by Richard on 2024.06.19
//

import Foundation
import Combine
import LibraryDomain_Model_Core
import LibraryDomain_Model_News

public class GetNewsImplements : GetNews {
    
    // MARK: - Instance functions.
    
    public static func getInstance(
        repository: NewsRepository
    ) -> GetNewsImplements {
        return GetNewsImplements(
            repository: repository
        )
    }
    
    private init(
        repository: NewsRepository
    ) {
        _repository = repository
    }
    
    // MARK: - Constants and Variables.
    
    private let _repository: NewsRepository
    
    // MARK: - Implements GetNews.
    
    public func callAsFunction(
        page: Int,
        size: Int
    ) -> AnyPublisher<PagingModel<NewsModel>, Error> {
        return self._repository.get(page: page, size: size)
            .receive(on: DispatchQueue.global(qos: .default))
            .eraseToAnyPublisher()
    }
}
