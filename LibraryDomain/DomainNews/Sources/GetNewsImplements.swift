//
//  GetNewsImplements.swift
//  LibraryDomain-News
//
//  Created by Richard on 2024.06.19
//

import Foundation
import Combine

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
    
    public func callAsFunction() -> AnyPublisher<String, Error> {
        return self._repository.get()
            .receive(on: DispatchQueue.global(qos: .default))
            .map { result in
                print("GetNewsImplements.map in \(Thread.current)")
                return result
            }
            .eraseToAnyPublisher()
    }
}
