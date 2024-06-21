//
//  PagingModel.swift
//  LibraryDomain-Model-Core
//
//  Created by Richard on 2024.06.21
//

import Foundation

public struct PagingModel<T> {
    
    public let total: Int64
    public let end: Bool
    public let contents: [T]
    
    public init(
        total: Int64 = 0,
        end: Bool = true,
        contents: [T] = []
    ) {
        self.total = total
        self.end = end
        self.contents = contents
    }
    
    public func toModel<R>(
        transform: (T) -> R
    ) -> PagingModel<R> {
        return PagingModel<R>(
            total: total,
            end: end,
            contents: contents.map { content in transform(content) }
        )
    }
}
