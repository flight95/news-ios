//
//  AnyPublisher+Empty.swift
//  LibraryDomain-Model-Core
//
//  Created by Richard on 2024.06.23
//

import Foundation
import Combine

extension AnyPublisher {
    
    public func flatMapEmptyContents<T>(
        callback: @escaping () -> AnyPublisher<PagingModel<T>, Error>
    ) -> AnyPublisher<PagingModel<T>, Error> where Output == PagingModel<T>, Failure == Error {
        flatMap { paging -> AnyPublisher<PagingModel<T>, Error> in
            if paging.contents.isEmpty {
                return callback()
            } else {
                return Just(paging)
                    .setFailureType(to: Error.self)
                    .eraseToAnyPublisher()
            }
        }
        .eraseToAnyPublisher()
    }
}
