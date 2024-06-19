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
    
    // ****************************************************************************************************
    // MARK: Instance functions.
    
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
        self.remote = remote
    }
    
    deinit {
        cancellables.forEach { cancellable in cancellable.cancel() }
    }
    
    // ****************************************************************************************************
    // MARK: Constants and Variables.
    
    private var cancellables = Set<AnyCancellable>()
    
    private let remote: NewsRemoteDataSource
    
    // ****************************************************************************************************
    // MARK: Implements GetNews.
    
    public func get() -> AnyPublisher<String, Error> {
        return Future<String, Error> { promise in
            self.remote.get()
                .subscribe(on: DispatchQueue.global(qos: .default))
                .sink(
                    receiveCompletion: { completion in
                        switch completion {
                            case .finished: break
                            case .failure(let error):
                                print("NewsRepositoryImplements.failure in \(Thread.current)")
                                promise(.failure(error))
                        }
                    },
                    receiveValue: { value in
                        print("NewsRepositoryImplements.success in \(Thread.current)")
                        promise(.success(value))
                    }
                )
                .store(in: &self.cancellables)
        }.eraseToAnyPublisher()
    }
}
