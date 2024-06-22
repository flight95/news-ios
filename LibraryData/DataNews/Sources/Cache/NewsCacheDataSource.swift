//
//  NewsCacheDataSource.swift
//  LibraryData-News
//
//  Created by Richard on 2024.06.22
//

import Foundation
import Combine
import LibraryDomain_Model_Core
import LibraryDomain_Model_News

public protocol NewsCacheDataSource {
    
    func set(
        model: NewsModel
    ) -> AnyPublisher<NewsModel?, Error>
    
    func get(
        page: Int,
        size: Int
    ) -> AnyPublisher<PagingModel<NewsModel>, Error>
    
    func add(
        paging: PagingModel<NewsModel>
    ) -> AnyPublisher<PagingModel<NewsModel>, Error>
    
    func remove() -> AnyPublisher<Bool, Error>
}
