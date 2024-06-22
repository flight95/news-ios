//
//  PagingData.swift
//  PagingLibrary
//
//  Created by Richard on 2024.06.21
//

import Foundation
import Combine

public class Pager<T: Identifiable> {
    
    // MARK: - Instance functions.
    
    public static func getInstance(
        config: PagingConfig,
        state: PageState<T>,
        pagingSourceFactory: @escaping () -> PagingSource<T>
    ) -> Pager {
        return Pager(
            config: config,
            state: state,
            pagingSourceFactory: pagingSourceFactory
        )
    }
    
    private init(
        config: PagingConfig,
        state: PageState<T>,
        pagingSourceFactory: @escaping () -> PagingSource<T>
    ) {
        self.state = state
        _config = config
        _pagingSourceFactory = pagingSourceFactory
        _pagingSource = nil
    }
    
    // MARK: - Constants and Variables.
    
    private(set) weak var state: PageState<T>? = nil
    
    private let _config: PagingConfig
    private let _pagingSourceFactory: () -> PagingSource<T>
    private var _pagingSource: PagingSource<T>?
    
    // MARK: - Functions.
    
    public func update(item: T) {
        state?.update(item: item)
    }
    
    public func append() {
        guard let status = state else {
            return
        }
        guard !status.paging && !status.finished else {
            return
        }
        status.error = nil
        load()
    }
    
    public func retry() {
        guard let status = state else {
            return
        }
        guard !status.paging && !status.finished && status.error != nil else {
            return
        }
        status.error = nil
        load()
    }
    
    public func refresh() {
        guard let status = state else {
            return
        }
        guard !status.paging else {
            return
        }
        status.key = _config.initialKey
        status.error = nil
        _pagingSource = nil
        load()
    }
    
    private func load() {
        guard let status = state else {
            return
        }
        status.paging = true
        
        if (_pagingSource == nil) {
            _pagingSource = _pagingSourceFactory()
        }
        if (status.key == nil) {
            status.key = _config.initialKey
        }
        
        if let paging = _pagingSource {
            do {
                try paging.append(
                    params: PagingSource<T>.LoadParams(key: status.key, loadSize: _config.pageSize)
                ) { result in
                    switch (result) {
                        case .error(let cause):
                            status.error = cause
                        case .invalid:
                            status.key = nil
                            status.error = nil
                            status.finished = true
                            self._pagingSource = nil
                        case let .page(items, nextKey):
                            status.key = nextKey
                            status.finished = nextKey == nil
                            status.error = nil
                            status.append(items: items)
                        case .finished:
                            if (status.paging) {
                                status.error = PagingError.append()
                            }
                    }
                    status.paging = false
                }
            } catch {
                status.error = PagingError.append(cause: error)
                status.paging = false
            }
        } else {
            status.paging = false
        }
    }
}
