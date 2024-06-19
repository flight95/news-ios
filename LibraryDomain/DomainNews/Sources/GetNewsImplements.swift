//
//  GetNewsImplements.swift
//  LibraryDomain-News
//
//  Created by Richard on 2024.06.19
//

import Foundation
import Combine

public class GetNewsImplements : GetNews {
    
    // ****************************************************************************************************
    // MARK: Instance functions.
    
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
        self.repository = repository
    }
    
    deinit {
        cancellables.forEach { cancellable in cancellable.cancel() }
    }
    
    // ****************************************************************************************************
    // MARK: Constants and Variables.
    
    private var cancellables = Set<AnyCancellable>()
    
    private let repository: NewsRepository
    
    // ****************************************************************************************************
    // MARK: Implements GetNews.
    
    public func callAsFunction() -> AnyPublisher<String, Error> {
        return Future<String, Error> { promise in
            self.repository.get()
                .subscribe(on: DispatchQueue.global(qos: .default))
                .sink(
                    receiveCompletion: { completion in
                        switch completion {
                            case .finished: break
                            case .failure(let error):
                                print("GetNewsImplements.failure in \(Thread.current)")
                                promise(.failure(error))
                        }
                    },
                    receiveValue: { value in
                        print("GetNewsImplements.success in \(Thread.current)")
                        promise(.success(value))
                    }
                )
                .store(in: &self.cancellables)
        }.eraseToAnyPublisher()
    }
}
