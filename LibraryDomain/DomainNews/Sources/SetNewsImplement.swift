//
//  SetNewsImplements.swift
//  LibraryDomain-News
//
//  Created by Richard on 2024.06.23
//

import Foundation
import Combine
import LibraryDomain_Model_Core
import LibraryDomain_Model_News

public class SetNewsImplements : SetNews {
    
    // MARK: - Instance functions.
    
    public static func getInstance(
        repository: NewsRepository
    ) -> SetNewsImplements {
        return SetNewsImplements(
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
    
    // MARK: - Implements SetNews.
    
    public func callAsFunction(
        model: NewsModel
    ) -> AnyPublisher<NewsModel?, Error> {
        return _repository.set(model: model)
            .receive(on: DispatchQueue.global(qos: .default))
            .eraseToAnyPublisher()
    }
}
