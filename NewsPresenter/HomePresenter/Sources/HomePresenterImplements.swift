//
//  HomePresenterImplements.swift
//  NewsPresenter-Home
//
//  Created by Richard on 2024.06.19
//

import Foundation
import Combine
import PagingLibrary
import LibraryDomain_Model_Core
import LibraryDomain_Model_News
import LibraryDomain_News

public class HomePresenterImplements : HomePresenter {
    
    // MARK: - Instance functions.
    
    public static func getInstance(
        setNews: SetNews,
        getNews: GetNews,
        removeNews: RemoveNews
    ) -> HomePresenterImplements {
        return HomePresenterImplements(
            setNews: setNews,
            getNews: getNews,
            removeNews: removeNews
        )
    }
    
    private init(
        setNews: SetNews,
        getNews: GetNews,
        removeNews: RemoveNews
    ) {
        _setNews = setNews
        _getNews = getNews
        _removeNews = removeNews
    }
    
    deinit { // This is canceled along with the lifecycle of the ObservableObject.
        _cancellables.forEach { cancellable in cancellable.cancel() }
        _cancellables.removeAll()
    }
    
    // MARK: - Constants and Variables.
    
    private var _cancellables = Set<AnyCancellable>()
    private var _setNews: SetNews
    private var _getNews: GetNews
    private var _removeNews: RemoveNews
    private var _pager: Pager<NewsModel>? = nil
    
    // MARK: - Implements HomePresenter.
    
    @Published public var pageState = PageState<NewsModel>.getInstance()
    
    public func initializePager() {
        if let pager = _pager {
            pager.refresh()
        } else {
            _pager = Pager<NewsModel>.getInstance(
                config: PagingConfig.getInstance(initialKey: 1, pageSize: 16),
                state: pageState
            ) {
                PagingSource<NewsModel>.getInstance { params, result in
                    self._getNews(page: params.key ?? 1, size: params.loadSize)
                        .receive(on: DispatchQueue.main)
                        .sink(
                            receiveCompletion: { completion in
                                switch completion {
                                    case .finished:
                                        result(PagingSource.LoadResult.finished)
                                    case .failure(let error):
                                        result(PagingSource.LoadResult.error(cause: PagingError.append(cause: error)))
                                }
                            },
                            receiveValue: { value in
                                let items = value.contents
                                if (!value.end && !items.isEmpty) {
                                    result(PagingSource.LoadResult.page(items: value.contents, nextKey: (params.key ?? 0) + 1))
                                } else {
                                    result(PagingSource.LoadResult.page(items: value.contents, nextKey: nil))
                                }
                            }
                        )
                        .store(in: &self._cancellables)
                }
            }
            _pager?.append()
        }
    }
    
    public func appendPager() {
        _pager?.append()
    }
    
    public func retryPager() {
        _pager?.retry()
    }
    
    public func refreshPager() {
        _removeNews()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                        case .finished: break
                        case .failure(let error): self._pager?.refresh()
                    }
                },
                receiveValue: { value in self._pager?.refresh() }
            )
            .store(in: &self._cancellables)
    }
    
    public func selectNews(news: NewsModel) {
        do {
            let select = try news.copy(openedAt: Date().timeIntervalSince1970)
            _pager?.update(item: select)
            _setNews(model: select)
                .receive(on: DispatchQueue.main)
                .sink(
                    receiveCompletion: { completion in
                        switch completion {
                            case .finished: break
                            case .failure:
                                self._pager?.update(item: news)
                        }
                    },
                    receiveValue: { value in
                        if (value == nil) {
                            self._pager?.update(item: news)
                        }
                    }
                )
                .store(in: &self._cancellables)
        } catch { }
    }
}
