//
//  PagingSource.swift
//  PagingLibrary
//
//  Created by Richard on 2024.06.21
//

import Foundation
import Combine

public class PagingSource<T: Identifiable> {
    
    // MARK: - Instance functions.
    
    public static func getInstance(
        load: @escaping (LoadParams, @escaping (LoadResult) -> Void) -> Void
    ) -> PagingSource {
        return PagingSource(
            load: load
        )
    }
    
    private init(
        load: @escaping (LoadParams, @escaping (LoadResult) -> Void) -> Void
    ) {
        _load = load
    }
    
    // MARK: - Constants and Variables.
    
    private var _load: (LoadParams, @escaping (LoadResult) -> Void) -> Void
    
    // MARK: - Sub struct for load.
    
    public enum LoadResult {
        case error(cause: PagingError)
        case invalid
        case page(items: [T], nextKey: Int?)
    }
    
    public struct LoadParams {
        public let key: Int?
        public let loadSize: Int
    }
    
    func append(
        params: LoadParams,
        completion: @escaping (LoadResult) -> Void
    ) {
        _load(params, completion)
    }
}

