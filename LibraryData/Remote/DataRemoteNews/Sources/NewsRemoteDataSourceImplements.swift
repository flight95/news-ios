//
//  NewsRemoteDataSourceImplements.swift
//  LibraryData-Remote-News
//
//  Created by Richard on 2024.06.19
//

import Foundation
import Combine
import LibraryDomain_Model_Core
import LibraryDomain_Model_News
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
    
    deinit { // This is canceled along with the lifecycle of the ObservableObject.
        _cancellables.forEach { cancellable in cancellable.cancel() }
        _cancellables.removeAll()
    }
    
    // MARK: - Constants and Variables.
    
    private var _cancellables = Set<AnyCancellable>()
    
    private let _authentication: String
    
    private let _api: NewsRemoteApi
    
    // MARK: - Implements NewsRemoteDataSource.
    
    public func get(
        page: Int,
        size: Int
    ) -> AnyPublisher<PagingModel<NewsModel>, Error> {
        return Future<PagingModel<NewsModel>, Error> { promise in
            self._api.get(
                authorization: self._authentication,
                page: page,
                size: size
            ).subscribe(on: DispatchQueue.global(qos: .background))
                .receive(on: DispatchQueue.global(qos: .background))
                .sink(
                    receiveCompletion: { completion in
                        switch completion {
                            case .finished: break
                            case .failure(let error):
                                promise(.failure(error.toNetworkError()))
                        }
                    },
                    receiveValue: { response in
                        if let total = response.totalResults?.aboveOrNil() {
                            promise(.success(
                                PagingModel(
                                    total: total,
                                    end: total <= (page * size),
                                    contents: response.articles?.compactMap { content in content.toModel() } ?? []
                                )
                            ))
                        } else {
                            promise(.failure(DataError.illegalState(message: "Total result could not be empty.")))
                        }
                    }
                )
                .store(in: &self._cancellables)
        }.eraseToAnyPublisher()
    }
}
