//
//  RemoveNewsImplements.swift
//  LibraryDomain-News
//
//  Created by Richard on 2024.06.23
//

import Foundation
import Combine
import LibraryDomain_Model_Core
import LibraryDomain_Model_News

public class RemoveNewsImplements : RemoveNews {
    
    // MARK: - Instance functions.
    
    public static func getInstance(
        repository: NewsRepository
    ) -> RemoveNewsImplements {
        return RemoveNewsImplements(
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
    
    // MARK: - Implements RemoveNews.
    
    public func callAsFunction() -> AnyPublisher<Bool, Error> {
        return _repository.remove()
            .receive(on: DispatchQueue.global(qos: .default))
            .eraseToAnyPublisher()
    }
}
