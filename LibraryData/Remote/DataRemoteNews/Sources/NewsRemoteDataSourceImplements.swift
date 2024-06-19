//
//  NewsRemoteDataSourceImplements.swift
//  LibraryData-Remote-News
//
//  Created by Richard on 2024.06.19
//

import Foundation
import Combine
import LibraryData_News
import LibraryData_Remote_Core

public class NewsRemoteDataSourceImplements : NewsRemoteDataSource {
    
    // MARK: - Instance functions.
    
    public static func getInstance(
        authentication: String,
        api: NewsRemoteApi
    ) -> NewsRemoteDataSourceImplements {
        return NewsRemoteDataSourceImplements(
            authentication: authentication,
            api: api
        )
    }
    
    private init(
        authentication: String,
        api: NewsRemoteApi
    ) {
        _authentication = authentication
        _api = api
    }
    
    deinit {
        _cancellables.forEach { cancellable in cancellable.cancel() }
    }
    
    // MARK: - Constants and Variables.
    
    private var _cancellables = Set<AnyCancellable>()
    
    private let _authentication: String
    
    private let _api: NewsRemoteApi
    
    // MARK: - Implements GetNews.
    
    public func get() -> AnyPublisher<String, Error> {
        return Future<String, Error> { promise in
            self._api.get(
                authorization: self._authentication,
                page: 1,
                size: 16
            ).subscribe(on: DispatchQueue.global(qos: .background))
                .receive(on: DispatchQueue.global(qos: .background))
                .sink(
                    receiveCompletion: { completion in
                        switch completion {
                            case .finished: break
                            case .failure(let error):
                                print("NewsRemoteDataSourceImplements.failure in \(Thread.current): \(error)")
                                promise(.failure(error))
                        }
                    },
                    receiveValue: { value in
                        print("NewsRemoteDataSourceImplements.success in \(Thread.current)")
                        print("value: \(value)")
                        promise(.success("NewsRemoteDataSourceImplements"))
                    }
                )
                .store(in: &self._cancellables)
        }.eraseToAnyPublisher()
    }
}
